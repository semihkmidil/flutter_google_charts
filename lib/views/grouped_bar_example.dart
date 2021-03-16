import 'package:flutter/material.dart';
import '../models/ui_model.dart';
import '../models/charts_model.dart';


class GroupedBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>getUi(context: context).getChartPage(
      chart: charts.getGroupedBarChart(
          dataList: groupedBarDataList,
          chartWidth: getScreenWidth(context: context)*0.8,
          chartHeight: getScreenHeight(context: context)*0.8
      ),
      pageTitle: "Grouped Bar Chart"
  );



  double getScreenWidth({BuildContext context})=>MediaQuery.of(context).size.width;
  double getScreenHeight({BuildContext context})=>MediaQuery.of(context).size.height;

  UiModel getUi({BuildContext context})=>UiModel(context: context);

  ChartsModel get charts=>ChartsModel(
      numAxisTextStyle: TextStyle(color: Colors.blueGrey[700], fontSize: 11.0, fontWeight: FontWeight.w600, fontFamily: ""),
      domainAxisTextStyle: TextStyle(color: Colors.blueGrey[800], fontSize: 8.0, fontWeight: FontWeight.w600, fontFamily: "")
  );

  List<List<BarData>> get groupedBarDataList=>[
    [
      BarData(barValue: 100, barLabel: "2015", barColor: Colors.blue),
      BarData(barValue: 10, barLabel: "2016", barColor: Colors.red),
      BarData(barValue: 40, barLabel: "2017", barColor: Colors.green)
    ],
    [
      BarData(barValue: 60, barLabel: "2015", barColor: Colors.blue.withOpacity(0.7)),
      BarData(barValue: 30, barLabel: "2016", barColor: Colors.red.withOpacity(0.7)),
      BarData(barValue: 20, barLabel: "2017", barColor: Colors.green.withOpacity(0.7))
    ],
    [
      BarData(barValue: 80, barLabel: "2015", barColor: Colors.blue.withOpacity(0.5)),
      BarData(barValue: 30, barLabel: "2016", barColor: Colors.red.withOpacity(0.5)),
      BarData(barValue: 40, barLabel: "2017", barColor: Colors.green.withOpacity(0.5))
    ]
  ];
}
