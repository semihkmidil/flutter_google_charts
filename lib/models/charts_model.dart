import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';

class ChartsModel{
  TextStyle numAxisTextStyle, domainAxisTextStyle;
  ChartsModel({this.numAxisTextStyle, this.domainAxisTextStyle});

  dynamic get numAxis=> charts.NumericAxisSpec(renderSpec: charts.GridlineRendererSpec(
    labelStyle: getTextStyleSpec(textStyle: numAxisTextStyle),
    lineStyle: getLineStyleSpec(color: numAxisTextStyle.color)
  ));

  dynamic get ordinalAxis=> charts.OrdinalAxisSpec(
    renderSpec: charts.SmallTickRendererSpec(
      labelStyle: getTextStyleSpec(textStyle: domainAxisTextStyle),
      lineStyle: getLineStyleSpec(color: domainAxisTextStyle.color)
    )
  );

  dynamic getTextStyleSpec({TextStyle textStyle})=>charts.TextStyleSpec(
    fontFamily: numAxisTextStyle.fontFamily,
    fontWeight: numAxisTextStyle.fontWeight.toString(),
    fontSize: numAxisTextStyle.fontSize.floor(),
    color: getChartsColor(color: textStyle.color)
  );

  dynamic getLineStyleSpec({Color color})=>charts.LineStyleSpec(color: getChartsColor(color: color));
  dynamic getChartsColor({Color color})=>charts.ColorUtil.fromDartColor(color);


  Widget getSimpleBarChart({List<BarData> dataList, double chartWidth, double chartHeight})=>Container(
    child: charts.BarChart(
      [getSimpleBarChartSeries(dataList: dataList)],
      animate: true,
      animationDuration: Duration(seconds: 2),
      primaryMeasureAxis: numAxis,
      domainAxis: ordinalAxis
    ),
    width: chartWidth,
    height: chartHeight
  );

  charts.Series getSimpleBarChartSeries({List<BarData> dataList})=>charts.Series<BarData, String>(
    id:"Simple Bar Chart",
    data: dataList,
    measureFn: (BarData value, _)=>value.barValue,
    domainFn: (BarData value, _)=>value.barLabel,
    colorFn: (BarData value, __)=>charts.ColorUtil.fromDartColor(value.barColor),
  );


  Widget getGroupedBarChart({List<List<BarData>> dataList, double chartWidth, double chartHeight})=>Container(
    child: charts.BarChart(
      getGroupedBarChartSeries(dataList: dataList),
      animate: true,
      animationDuration: Duration(seconds: 2),
      primaryMeasureAxis: numAxis,
      domainAxis: ordinalAxis,
      barGroupingType: charts.BarGroupingType.grouped,
    ),
    width: chartWidth,
    height: chartHeight
  );

  List<charts.Series> getGroupedBarChartSeries({List<List<BarData>> dataList})=>List<charts.Series<BarData, String>>.generate(
      dataList.length, (index) => charts.Series<BarData, String>(
        id:"Grouped Bar Chart",
        data: dataList[index],
        measureFn: (BarData value, _)=>value.barValue,
        domainFn: (BarData value, _)=>value.barLabel,
        colorFn: (BarData value, __)=>charts.ColorUtil.fromDartColor(value.barColor),
      )
  );

  Widget getStackedAreaChart({List<List<LineData>> dataList, List<Color> areaColorList, double chartWidth, double chartHeight})=>Container(
      child: charts.LineChart(
        getStackedAreaChartSeries(dataList: dataList, areaColorList: areaColorList),
        defaultRenderer: charts.LineRendererConfig(includeArea: true, stacked: false),
        animate: true,
        animationDuration: Duration(seconds: 2),
      ),
      width: chartWidth,
      height: chartHeight
  );


  List<charts.Series> getStackedAreaChartSeries({List<List<LineData>> dataList, List<Color> areaColorList})=>List<charts.Series<LineData, int>>.generate(
      dataList.length, (index) => charts.Series<LineData, int>(
    id:"Stacked Area Chart",
    data: dataList[index],
    measureFn: (LineData value, _)=>value.verticalValue,
    domainFn: (LineData value, _)=>value.horizontalValue,
    colorFn: (LineData value, __)=>charts.ColorUtil.fromDartColor(areaColorList[index]),
  )
  );

  Widget getAreaAndLineChart({List<List<LineData>> dataList, List<Color> colorList, List<bool> areaConfirmationList, double chartWidth, double chartHeight})=>Container(
      child: charts.LineChart(
          getAreaAndLineChartSeries(dataList: dataList, colorList: colorList, areaConfirmationList: areaConfirmationList),
          customSeriesRenderers:[
            charts.LineRendererConfig(
              customRendererId: "area",
              stacked: false,
              includeArea: true
            ),
            charts.LineRendererConfig(
              customRendererId: "line"
            )
          ],
          animate: true,
          animationDuration: Duration(seconds: 2)
      ),
      width: chartWidth,
      height: chartHeight
  );

  List<charts.Series> getAreaAndLineChartSeries({List<List<LineData>> dataList, List<bool> areaConfirmationList, List<Color> colorList})=>List<charts.Series<LineData, int>>.generate(
      dataList.length, (index) => charts.Series<LineData, int>(
    id:"Stacked Area Chart",
    data: dataList[index],
    measureFn: (LineData value, _)=>value.verticalValue,
    domainFn: (LineData value, _)=>value.horizontalValue,
    colorFn: (LineData value, __)=>charts.ColorUtil.fromDartColor(colorList[index]),
  )..setAttribute(charts.rendererIdKey, areaConfirmationList[index]?"area":"line")
  );

  Widget getSimplePieChart({List<PieData> dataList, double chartWidth, double chartHeight})=>Container(
    child: charts.PieChart(
      getSimplePieChartSeries(dataList: dataList),
      animate: true,
      animationDuration: Duration(seconds: 2)
    ),
    width: chartWidth,
    height: chartHeight
  );


  List<charts.Series<PieData, int>> getSimplePieChartSeries({List<PieData> dataList})=>[
    charts.Series<PieData, int>(
      id:"Simple Pie Chart",
      data: dataList,
      measureFn: (PieData value, _)=>value.value,
      domainFn: (PieData value, _)=>value.percentage,
      colorFn: (PieData value, __)=>charts.ColorUtil.fromDartColor(value.color),
    )
  ];

  Widget getAutoLabelPieChart({List<PieData> dataList, TextStyle insideLabelTextStyle, TextStyle outsideLabelTextStyle, Color outsideLineColor, double chartWidth, double chartHeight})=>Container(
    child: charts.PieChart(
        getAutoLabelPieChartSeries(dataList: dataList),
        animate: true,
        animationDuration: Duration(seconds: 2),
        defaultRenderer: charts.ArcRendererConfig(
          ///ArchWidth for middle space, if ArchWidth value lesser than space width will become more.
            arcWidth: (chartWidth*0.25).floor(),
            arcRendererDecorators: [
              charts.ArcLabelDecorator(
                  insideLabelStyleSpec: getTextStyleSpec(textStyle: insideLabelTextStyle),
                  outsideLabelStyleSpec: getTextStyleSpec(textStyle: outsideLabelTextStyle),
                  leaderLineStyleSpec: charts.ArcLabelLeaderLineStyleSpec(color: charts.ColorUtil.fromDartColor(outsideLineColor), length: 30.0)
              )
            ]
        ),
    ),
    width: chartWidth,
    height: chartHeight
  );

  List<charts.Series<PieData, int>> getAutoLabelPieChartSeries({List<PieData> dataList})=>[
    charts.Series<PieData, int>(
      id:"Auto Label Pie Chart",
      data: dataList,
      measureFn: (PieData value, _)=>value.value,
      domainFn: (PieData value, _)=>value.percentage,
      colorFn: (PieData value, __)=>charts.ColorUtil.fromDartColor(value.color),
    )
  ];
}

class BarData{
  final String barLabel;
  final int barValue;
  final Color barColor;
  BarData({this.barLabel, this.barValue, this.barColor});
}

class LineData{
  final int verticalValue, horizontalValue;
  LineData({this.verticalValue, this.horizontalValue});
}

class PieData{
  final int value;
  int percentage;
  final Color color;
  PieData({this.value, int chartTotalAmount, this.color}){
    percentage=(chartTotalAmount!=null&&chartTotalAmount!=0)?((value/chartTotalAmount)*100).round():0;
  }
}