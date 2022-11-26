import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CustomTheme customTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = false;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        brightness: Brightness.light,
        primaryTextTheme:
            TextTheme(headline6: TextStyle(color: Colors.black87)),
        iconTheme: IconThemeData(color: Colors.black87),
        cardColor: Color.fromARGB(155, 255, 255, 255),
        // canvasColor: Colors.white,
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.red,
            ),
            headline5: TextStyle(
              color: Colors.red,
            ),
            headline6: TextStyle(
              color: Colors.black,
            )),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.cyanAccent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                ))),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.cyanAccent,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.red)),
        iconTheme: IconThemeData(color: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.amber,
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
        // canvasColor: Colors.black,
        cardColor: Color.fromARGB(155, 90, 90, 90),
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[900],
        fontFamily: 'Montserrat',
        // textTheme: ThemeData.dark().textTheme,
        textTheme: TextTheme(
            subtitle2: TextStyle(color: Colors.white70, height: 1.5),
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                ))),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ));
  }
}

ThemeData appThemLight = ThemeData(
  backgroundColor: Colors.grey[200],
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)))),
);
