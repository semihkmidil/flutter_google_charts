import 'package:flutter/material.dart';
import 'package:google_charts_sample_app/views/simple_bar_example.dart';
import 'views/charts_page.dart';
import 'views/auto_label_pie_example.dart';
import 'views/grouped_bar_example.dart';
import 'views/simple_pie_example.dart';
import 'views/stacked_area_example.dart';
import 'views/area_and_line_example.dart';

void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>MaterialApp(
    title: "Google Charts Sample App",
    initialRoute: "/",
    routes: routes,
  );

  Map<String, WidgetBuilder> get routes=>{
    '/':(context)=>ChartsPage(),
    'simpleBarExample':(context)=>SimpleBarExample(),
    'autoLabelPieExample':(context)=>AutoLabelPieExample(),
    'groupedBarExample':(context)=>GroupedBarExample(),
    'simplePieExample':(context)=>SimplePieExample(),
    'stackedAreaExample':(context)=>StackedAreaExample(),
    'areaAndLineExample':(context)=>AreaAndLineExample()
  };

}
