import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vpn21/Screen/HomePage.dart';
import 'package:flutter_vpn21/config/them.dart';
import 'package:flutter_vpn21/main.dart';
import 'package:flutter_vpn21/models/CardModel.dart';
import 'package:flutter_vpn21/models/UserModel.dart';
import 'package:flutter_vpn21/service/FireBaseConnection.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';
import '../shered/card_widget_list.dart';

late FirebaseFirestore db;

class DiscountPage extends StatefulWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  CollectionReference<CardModel>? _collectionRef;

  void getDataOnce_getADocument() {
    // [START get_data_once_get_a_document]
    final docRef = db.collection("cities").doc("SF");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
    // [END get_data_once_get_a_document]
  }

  @override
  void initState() {
    db = FirebaseFirestore.instance;
    if (db != null) {
      print(db.toString());
    }
    _collectionRef = db.collection('syti').withConverter<CardModel>(
        fromFirestore: (snapshot, _) => CardModel.fromJson(snapshot.data()!),
        toFirestore: (card, options) =>
            card.toJson()); // получаю CollectionReference<CardModel>?
    // _collectionRef = ...  // получаю Stream<QuerySnapshot<CardModel>>?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Скидки"),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: _collectionRef == null
            ? const Center(child: Text("Акций пока нет"))
            : StreamBuilder<QuerySnapshot<CardModel>>(
                stream: Connection().discount,
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('error ${snapshot.error}');
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data!.docs[index].data();
                        return CardWidgetList(
                          items: item,
                        );
                      });
                })));
  }
}
