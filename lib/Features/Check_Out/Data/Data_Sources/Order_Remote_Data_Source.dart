import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:meta/meta.dart';


abstract class OrderRemoteDataSource {

  Future<void> saveOrder(Map<String,dynamic> map,String orderNumber, String date);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final FirebaseFirestore firestore;

  OrderRemoteDataSourceImpl({@required this.firestore});


  @override
  Future<void> saveOrder(Map<String, dynamic> map, String orderNumber, String date) async {

    firestore.collection("Orders").doc('$orderNumber - $date ').set(map);

  }
}