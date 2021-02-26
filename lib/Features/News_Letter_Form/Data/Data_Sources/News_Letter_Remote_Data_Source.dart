import 'dart:convert';
import 'dart:math';

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
    Random random = new Random();
    int randomNumber = random.nextInt(100);

    firestore.collection("NewsLetterSubscribers").doc('Email').update({
         '$randomNumber': email

       });

  }
}