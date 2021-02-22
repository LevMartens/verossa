import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Util/Input_Converter.dart';

import 'Item_Factory.dart';

class ItemProvider extends ChangeNotifier {
  final ItemFactory factory;

  ItemProvider({
    @required ItemFactory factory,
  })  : assert(factory != null),
        factory = factory;

  void r() {

  }
}
