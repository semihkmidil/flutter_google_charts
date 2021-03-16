import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>getUi(context: context).getPage(
    pageTitle: "Chart Examples",
    pageElements: [
      Container(
        child: Text(
          "You can look at the bigger charts with pressing their names",
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w500, letterSpacing: 1.0, color: Colors.blueGrey[700]),
        ),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: getWidthWithContext(context: context)*0.15),
        margin: EdgeInsets.only(top:25.0),
        width: getWidthWithContext(context: context),
      ),
      getChartButtonRow(
          getChartButtonList: [
            getChartContainer(title: "Simple Bar", chart: getSimpleBarChart(context: context), routeName: "simpleBarExample", context: context),
            getChartContainer(title: "Grouped Bar", chart: getGroupedBarChart(context: context), routeName: "groupedBarExample", context: context)
          ]
      ),
      getChartButtonRow(
          getChartButtonList: [
            getChartContainer(title: "Stacked Area", chart: getStackedAreaChart(context: context), routeName: "stackedAreaExample", context: context),
            getChartContainer(title: "Area And Line", chart: getAreaAndLineChart(context: context), routeName: "areaAndLineExample", context: context)
          ]
      ),
      getChartButtonRow(
          getChartButtonList: [
            getChartContainer(title: "Simple Pie", routeName: "simplePieExample", chart: getSimplePieChart(context: context), context: context),
            getChartContainer(title: "Auto Label Pie", routeName: "autoLabelPieExample", chart: getAutoLabelPieChart(context: context), context: context)
          ]
      ),
    ]
  );

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  double getWidthWithContext({BuildContext context})=>MediaQuery.of(context).size.width;
  double getHeightWithContext({BuildContext context})=>MediaQuery.of(context).size.height;
  double getChartWidth({BuildContext context})=> (getWidthWithContext(context: context)*0.5)*0.8;
  double getChartHeight({BuildContext context})=> getHeightWithContext(context: context)*0.3;

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  Widget getSimpleBarChart({BuildContext context})=>charts.getSimpleBarChart(dataList: simpleBarDataList, chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));
  Widget getGroupedBarChart({BuildContext context})=>charts.getGroupedBarChart(dataList: groupedBarDataList, chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));
  Widget getStackedAreaChart({BuildContext context})=>charts.getStackedAreaChart(dataList: stackedAreaDataList, areaColorList: stackedAreColorList, chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));
  Widget getSimplePieChart({BuildContext context})=>charts.getSimplePieChart(dataList: simplePieChartDataList, chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));

  TextStyle get exampleLabelTextStyle=>TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "");
  Widget getAutoLabelPieChart({BuildContext context})=>charts.getAutoLabelPieChart(dataList: autoLabelPieDataList, insideLabelTextStyle: exampleLabelTextStyle, outsideLabelTextStyle: exampleLabelTextStyle, outsideLineColor: Colors.blueGrey[800], chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));

  ///areaConfirmationList parameter using for decide to draw a line or an area for the line data.
  Widget getAreaAndLineChart({BuildContext context})=>charts.getAreaAndLineChart(dataList: stackedAreaDataList, colorList: stackedAreColorList, areaConfirmationList: [false, false, true], chartWidth: getChartWidth(context: context), chartHeight: getChartHeight(context: context));


  Widget getChartButtonRow({List<Widget> getChartButtonList})=>Row(children: getChartButtonList, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center);

  Widget getChartContainer({String title, Widget chart, String routeName, BuildContext context})=>Container(
      child: Column(
          children: [
            SizedBox(height: 15.0),
            getChartTitle(title: title, routeName: routeName, context: context),
            SizedBox(height: 10.0),
            chart
          ],
          crossAxisAlignment: CrossAxisAlignment.center
      ),
      width: MediaQuery.of(context).size.width/2,
    );

  Widget getChartTitle({String title, String routeName, BuildContext context})=>GestureDetector(
    child: Container(
      child: Text(title, style: TextStyle(fontSize:17.0, fontWeight: FontWeight.w500, color: Colors.blueGrey[800]), textAlign: TextAlign.center),
      width: double.infinity,
    ),
    onTap: ()=>Navigator.pushNamed(context, routeName),
  );

  List<BarData> get simpleBarDataList=>[
    BarData(barValue: 100, barLabel: "2015", barColor: Colors.blue),
    BarData(barValue: 10, barLabel: "2016", barColor: Colors.red),
    BarData(barValue: 40, barLabel: "2017", barColor: Colors.green)
  ];

  List<List<BarData>> get groupedBarDataList=>[
    simpleBarDataList,
    [
      BarData(barValue: 60, barLabel: "2015", barColor: Colors.blue.withOpacity(0.7)),
      BarData(barValue: 30, barLabel: "2016", barColor: Colors.red.withOpacity(0.7)),
      BarData(barValue: 20, barLabel: "2017", barColor: Colors.green.withOpacity(0.7))
    ],
    [
      BarData(barValue: 80, barLabel: "2015", barColor: Colors.blue.withOpacity(0.5)),
      BarData(barValue: 30, barLabel: "2016", barColor: Colors.red.withOpacity(0.5)),
      BarData(barValue: 40, barLabel: "2017", barColor: Colors.green.withOpacity(0.5))
    ],
  ];

  ///While giving numerical value, you must be careful because horizontal value must go growing or formed shape become an absurd shape.
  List<List<LineData>> get stackedAreaDataList=>[
    [
      LineData(verticalValue: 0, horizontalValue: 0),
      LineData(verticalValue: 50, horizontalValue: 1),
      LineData(verticalValue: 30, horizontalValue: 2),
    ],
    [
      LineData(verticalValue: 0, horizontalValue: 0),
      LineData(verticalValue: 40, horizontalValue: 1),
      LineData(verticalValue: 7, horizontalValue: 2),
    ],
    [
      LineData(verticalValue: 0, horizontalValue: 0),
      LineData(verticalValue: 5, horizontalValue: 1),
      LineData(verticalValue: 20, horizontalValue: 2),
    ]
  ];

  List<Color> get stackedAreColorList=>[
    Colors.blue,
    Colors.red,
    Colors.green
  ];

  List<PieData> get simplePieChartDataList=>[
    PieData(value: 50, chartTotalAmount: 100, color: Colors.blue),
    PieData(value: 40, chartTotalAmount: 100, color: Colors.red),
    PieData(value: 10, chartTotalAmount: 100, color: Colors.green),
  ];

  List<PieData> get autoLabelPieDataList=>[
    PieData(value: 50, chartTotalAmount: 100, color: Colors.blue),
    PieData(value: 40, chartTotalAmount: 100, color: Colors.red),
    PieData(value: 10, chartTotalAmount: 100, color: Colors.green),
    PieData(value: 1, chartTotalAmount: 101, color: Colors.yellow)
  ];
}
