import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

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