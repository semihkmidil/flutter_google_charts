import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';

class AutoLabelPieExample extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>getUi(context: context).getChartPage(
      chart: charts.getAutoLabelPieChart(
          dataList: autoLabelPieData,
          insideLabelTextStyle: exampleLabelTextStyle,
          outsideLabelTextStyle: exampleLabelTextStyle,
          outsideLineColor: Colors.blueGrey[800],
          chartWidth: getScreenWidth(context: context)*0.8,
          chartHeight: getScreenHeight(context: context)*0.8
      ),
      pageTitle: "Auto Label Pie Chart"
  );

  double getScreenWidth({BuildContext context})=>MediaQuery.of(context).size.width;
  double getScreenHeight({BuildContext context})=>MediaQuery.of(context).size.height;

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  TextStyle get exampleLabelTextStyle=>TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "");

  List<PieData> get autoLabelPieData=>[
    PieData(value: 50, chartTotalAmount: 100, color: Colors.blue),
    PieData(value: 40, chartTotalAmount: 100, color: Colors.red),
    PieData(value: 10, chartTotalAmount: 100, color: Colors.green),
    PieData(value: 1, chartTotalAmount: 101, color: Colors.yellow)
  ];
}
