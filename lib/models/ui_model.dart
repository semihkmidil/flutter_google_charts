import 'package:flutter/material.dart';

class UiModel{
  BuildContext context;
  UiModel({this.context});

  Color get appBarContentColor=>Colors.blueGrey[800];
  Color get appBarBackgroundColor=>Colors.grey[200];
  Color get backgroundColor=>Colors.grey[200];

  IconButton get backButton=>IconButton(
    icon: Icon(Icons.arrow_back_ios_rounded, color: appBarContentColor),
    onPressed: ()=>Navigator.pop(context),
  );

  AppBar getAppBar({String title, bool isBackButtonActive})=>AppBar(
    title: Text(title, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.0, color: appBarContentColor)),
    centerTitle: true,
    leading: isBackButtonActive?backButton:null,
    backgroundColor: appBarBackgroundColor,
  );

  Scaffold getPage({List<Widget> pageElements, String pageTitle})=>Scaffold(
    appBar: getAppBar(title: pageTitle, isBackButtonActive: false),
    body: getPageBody(pageElements: pageElements),
    backgroundColor: backgroundColor,
  );

  Widget getPageBody({List<Widget> pageElements})=>Container(
    child: SingleChildScrollView(
      child: Column(
        children: pageElements,
      ),
    ),
    width: double.infinity,
    height: double.infinity
  );

  Scaffold getChartPage({Widget chart, String pageTitle})=>Scaffold(
      appBar: getAppBar(title: pageTitle, isBackButtonActive: true),
      body: Container(
        child: Center(
          child: chart,
        ),
        color: backgroundColor,
        width: double.infinity,
        height: double.infinity
      )
  );
}