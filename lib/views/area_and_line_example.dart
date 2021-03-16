import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';

class AreaAndLineExample extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>getUi(context: context).getChartPage(
      chart: charts.getAreaAndLineChart(
          dataList: areaAndLineData,
          areaConfirmationList: [false, false, true],
          colorList: colorList,
          chartWidth: getScreenWidth(context: context)*0.8,
          chartHeight: getScreenHeight(context: context)*0.8
      ),
      pageTitle: "Area And Line Chart"
  );

  double getScreenWidth({BuildContext context})=>MediaQuery.of(context).size.width;
  double getScreenHeight({BuildContext context})=>MediaQuery.of(context).size.height;

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  List<List<LineData>> get areaAndLineData=>[
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

  List<Color> get colorList=>[
    Colors.blue,
    Colors.red,
    Colors.green
  ];

}
