import 'package:flutter/material.dart';
import 'screen/DiscountPage.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/auth': (BuildContext context) => DiscountPage(),
  // '/splashscreen': (BuildContext context) => SplashScreen(),
  // '/app': (BuildContext context) => MainApp(),
  // '/employee': (BuildContext context) => ProfileTeacher(),
};

// List<Map<String, WidgetBuilder>> appMainRoutes = [
//   {'/': (BuildContext context) => QuestionCategories()}
// ];