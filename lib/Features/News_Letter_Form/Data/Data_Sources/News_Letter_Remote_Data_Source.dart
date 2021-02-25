import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'package:verossa/Features/News_Letter_Form/Data/Models/News_Letter_Model.dart';

abstract class NewsLetterRemoteDataSource {

  Future<void> saveEmail(String email);
}




class NewsLetterRemoteDataSourceImpl implements NewsLetterRemoteDataSource {
  final FirebaseFirestore firestore;

  NewsLetterRemoteDataSourceImpl({@required this.firestore});


  @override
  Future<void> saveEmail(String email) async {


    //firestore.collection("CurrentStock").doc('Items').set(linkedHashMap);

  }
}