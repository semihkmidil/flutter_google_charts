import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';

class SimplePieExample extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>getUi(context: context).getChartPage(
      chart: charts.getSimplePieChart(
          dataList: simplePieChartData,
          chartWidth: getScreenWidth(context: context)*0.8,
          chartHeight: getScreenHeight(context: context)*0.8
      ),
      pageTitle: "Simple Pie Chart"
  );

  double getScreenWidth({BuildContext context})=>MediaQuery.of(context).size.width;
  double getScreenHeight({BuildContext context})=>MediaQuery.of(context).size.height;

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  List<PieData> get simplePieChartData=>[
    PieData(value: 50, chartTotalAmount: 100, color: Colors.blue),
    PieData(value: 40, chartTotalAmount: 100, color: Colors.red),
    PieData(value: 10, chartTotalAmount: 100, color: Colors.green),
  ];
}
