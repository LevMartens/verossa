import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Features/Currency_Converter/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';


import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import 'package:verossa/Core/Util/Input_Converter.dart';



class ExchangeRatesProvider extends ChangeNotifier {
  // final SetCartBadgeNumber setCartBadgeNumber;
   final GetExchangeRates getExchangeRates;
  final InputConverter inputConverter;
  // int cartBadgeCount = 0;

  ExchangeRatesProvider({
     @required GetExchangeRates rates,
    // @required SetCartBadgeNumber number,
    @required this.inputConverter,
   })  : //assert(count != null),
         assert(rates != null),
        assert(inputConverter != null),
        // setCartBadgeNumber = number,
         getExchangeRates = rates;





  void getExchangeRatesNow() async {



    final failureOrExchangeRates = await getExchangeRates(NoParams());
    final rateUSD = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateUSD);

    print('rateUSD: $rateUSD');

    //notifyListeners();
  }


}