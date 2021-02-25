import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
//import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';


import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import 'package:verossa/Core/Util/Input_Converter.dart';



class NewsLetterProvider extends ChangeNotifier {
  final SetEmailToMailingList setEmailToMailingList;


  final InputConverter inputConverter;


  NewsLetterProvider({

    @required SetEmailToMailingList setEmailToMailingList,
    @required this.inputConverter,
  })  : assert(setEmailToMailingList != null),
        assert(inputConverter != null),
        setEmailToMailingList = setEmailToMailingList;

  void saveEmailInMailingList(String email) {
          setEmailToMailingList(Params(email: email));
  }

}