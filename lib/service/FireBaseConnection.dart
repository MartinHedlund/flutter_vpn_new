import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_vpn21/models/CardModel.dart';

import '../firebase_options.dart';

class Connection {
  final String? uid;

  Connection({this.uid});

  final CollectionReference _discountCollRef =
      FirebaseFirestore.instance.collection('syti');

  Future updateDiscDocRef(String path) async {
    return await _discountCollRef.doc(uid).set('');
  }

  Stream<QuerySnapshot<CardModel>> get discount {
    return _discountCollRef
        .withConverter<CardModel>(
            fromFirestore: (snapshot, _) =>
                CardModel.fromJson(snapshot.data()!),
            toFirestore: (card, options) => card.toJson())
        .orderBy('title')
        .snapshots();
  }
}
