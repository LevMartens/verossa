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



class CartBadgeProvider extends ChangeNotifier {
  final SetCartBadgeNumber setCartBadgeNumber;
  final GetCartBadgeNumber getCartBadgeNumber;
  final InputConverter inputConverter;
  int cartBadgeCount = 0;

  CartBadgeProvider({
    @required GetCartBadgeNumber count,
    @required SetCartBadgeNumber number,
    @required this.inputConverter,
  })  : assert(count != null),
        assert(number != null),
        assert(inputConverter != null),
        setCartBadgeNumber = number,
        getCartBadgeNumber = count;





  void updateCartBadgeCountWith(int newCount) async {

     setCartBadgeNumber(Params(number: newCount));

     final failureOrCartBadgeNumber = await getCartBadgeNumber(NoParams());
     final newCartBadgeCount = failureOrCartBadgeNumber.fold((failure) => 0, (cartBadgeNumber) => cartBadgeNumber.number);
    
     cartBadgeCount = newCartBadgeCount;
         
     notifyListeners();
  }

  void getLastCardBadgeCount() async {

    final failureOrCartBadgeNumber = await getCartBadgeNumber(NoParams());
    final lastCartBadgeCount = failureOrCartBadgeNumber.fold((failure) => 0, (cartBadgeNumber) => cartBadgeNumber.number);

    cartBadgeCount = lastCartBadgeCount;

    notifyListeners();
  }
}