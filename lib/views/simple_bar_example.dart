import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';

class SimpleBarExample extends StatelessWidget {

  @override
  Widget build(BuildContext context)=>getUi(context: context).getChartPage(
      chart: charts.getSimpleBarChart(
        dataList: simpleBarDataList,
        chartWidth: getScreenWidth(context: context)*0.8,
        chartHeight: getScreenHeight(context: context)*0.8
      ),
      pageTitle: "Simple Bar Chart"
  );



  double getScreenWidth({BuildContext context})=>MediaQuery.of(context).size.width;
  double getScreenHeight({BuildContext context})=>MediaQuery.of(context).size.height;

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  List<BarData> get simpleBarDataList=>[
    BarData(barValue: 100, barLabel: "2015", barColor: Colors.blue),
    BarData(barValue: 10, barLabel: "2016", barColor: Colors.red),
    BarData(barValue: 40, barLabel: "2017", barColor: Colors.green)
  ];

}
