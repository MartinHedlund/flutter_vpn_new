// ignore_for_file: unnecessary_const
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn21/screen/HomePage.dart';
import 'package:flutter_vpn21/screen/ProfilPage.dart';
import 'package:flutter_vpn21/screen/DiscountPage.dart';
import 'package:flutter_vpn21/routs.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'config/them.dart';
import 'models/CardModel.dart';
import 'models/UserModel.dart';
import 'firebase_options.dart';
import 'service/FireBaseConnection.dart';
import 'shered/card_widget_list.dart';

late final FirebaseFirestore _DB;
late final UsersModel usersModel;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectindex = 0;

  List<CardWidgetList> t = [];
  late final moviesCollection;

  CollectionReference<CardModel>? _collectionRef;

  /// Вынести все стили и темы в оттдельный файл
  @override
  void initState() {
    // UsersModel(user: [User(email: "seva@gmail.com")]);
    // moviesCollection =
    //     CardModel(title: 'Lol123', img: 'Non123', descrtiption: 'test123');

    // moviesCollection = FirebaseFirestore.instance.collection('items');
    customTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final widgetOptions = [DiscountPage(), HomePage(), ProfilPage()];

  void _OnTaped(int index) => setState(() {
        selectindex = index;
      });
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: customTheme.currentTheme,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_sharp),
                  label: 'Акции',
                  activeIcon: Icon(Icons.bookmark_sharp)),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(Icons.home),
                  label: 'Домой+'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Профиль',
                  activeIcon: Icon(Icons.person)),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            selectedItemColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor: Colors.grey,
            currentIndex: selectindex,
            onTap: _OnTaped,
          ),
          body:
              // widgetOptions[selectindex]
              IndexedStack(
            children: widgetOptions,
            index: selectindex,
          ) // сохраняет состояние страницы
          ),
      routes: appRoutes,
    );
  }
}
