import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Prices/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';


import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import 'package:verossa/Core/Util/Input_Converter.dart';



class PricesProvider extends ChangeNotifier {
  // final SetCartBadgeNumber setCartBadgeNumber;
   final GetExchangeRates getExchangeRates;
  final InputConverter inputConverter;
  final ItemFactory itemFactory;
  // int cartBadgeCount = 0;

   String priceItem1;
   String priceItem2;
   String priceItem3;
   String priceItem4;
   String priceItem5;
   String priceItem6;

   String totalPrice;

   Map<int, double> toCalculate;

  PricesProvider({
     @required GetExchangeRates rates,
    // @required SetCartBadgeNumber number,
    @required this.itemFactory,
    @required this.inputConverter,
   })  : assert(itemFactory != null),
         assert(rates != null),
        assert(inputConverter != null),
         //setCartBadgeNumber = number,
         getExchangeRates = rates;





  Future<void> setCurrencyTo(BuildContext context, String currencyCode) async {

    var currencySymbol;

    final failureOrExchangeRates = await getExchangeRates(NoParams());


    final item1AUD = itemFactory.item1.priceAUD;
    final item2AUD = itemFactory.item2.priceAUD;
    final item3AUD = itemFactory.item3.priceAUD;
    final item4AUD = itemFactory.item4.priceAUD;
    final item5AUD = itemFactory.item5.priceAUD;
    final item6AUD = itemFactory.item6.priceAUD;


    final rateAUD = 1;
    final rateUSD = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateUSD);
    final rateCAN = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateCAN);
    final rateINR = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateINR);
    final rateGBP = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateGBP);
    final rateEUR = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateEUR);
    final rateJPY = failureOrExchangeRates.fold((failure) => 0, (rates) => rates.rateJPY);



    switch (currencyCode) {

      case 'AUD':
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem2 = '\$${(item2AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem3 = '\$${(item3AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem4 = '\$${(item4AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem5 = '\$${(item5AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem6 = '\$${(item6AUD * rateAUD).toStringAsFixed(2)} AUD';

        break;

      case 'USD':
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem2 = '\$${(item2AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem3 = '\$${(item3AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem4 = '\$${(item4AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem5 = '\$${(item5AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem6 = '\$${(item6AUD * rateUSD).toStringAsFixed(2)} USD';

        break;

      case 'CAN':
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateCAN).toStringAsFixed(2)} CAN';
        priceItem2 = '\$${(item2AUD * rateCAN).toStringAsFixed(2)} CAN';
        priceItem3 = '\$${(item3AUD * rateCAN).toStringAsFixed(2)} CAN';
        priceItem4 = '\$${(item4AUD * rateCAN).toStringAsFixed(2)} CAN';
        priceItem5 = '\$${(item5AUD * rateCAN).toStringAsFixed(2)} CAN';
        priceItem6 = '\$${(item6AUD * rateCAN).toStringAsFixed(2)} CAN';
        break;

      case 'INR':
        currencySymbol = '\₹';
        priceItem1 = '\₹${(item1AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem2 = '\₹${(item2AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem3 = '\₹${(item3AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem4 = '\₹${(item4AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem5 = '\₹${(item5AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem6 = '\₹${(item6AUD * rateINR).toStringAsFixed(2)} INR';
        break;

      case 'GBP':
        currencySymbol = '\£';
        priceItem1 = '\£${(item1AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem2 = '\£${(item2AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem3 = '\£${(item3AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem4 = '\£${(item4AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem5 = '\£${(item5AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem6 = '\£${(item6AUD * rateGBP).toStringAsFixed(2)} GBP';
        break;

      case 'EUR':
        currencySymbol = '\€';
        priceItem1 = '\€${(item1AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem2 = '\€${(item2AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem3 = '\€${(item3AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem4 = '\€${(item4AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem5 = '\€${(item5AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem6 = '\€${(item6AUD * rateEUR).toStringAsFixed(2)} EUR';
        break;

      case 'JPY':
        currencySymbol = '\¥';
        priceItem1 = '\¥${(item1AUD * rateJPY).toStringAsFixed(2)} JPY';
        priceItem2 = '\¥${(item2AUD * rateJPY).toStringAsFixed(2)} JPY';
        priceItem3 = '\¥${(item3AUD * rateJPY).toStringAsFixed(2)} JPY';
        priceItem4 = '\¥${(item4AUD * rateJPY).toStringAsFixed(2)} JPY';
        priceItem5 = '\¥${(item5AUD * rateJPY).toStringAsFixed(2)} JPY';
        priceItem6 = '\¥${(item6AUD * rateJPY).toStringAsFixed(2)} JPY';
        break;

      

        
    }
    
    await mapPricesForTotalCalculation();
    await setCurrencyForTotalTo(context, currencyCode, currencySymbol);
    print('priceItem1: $priceItem1');

    notifyListeners();
  }

  Future<void> mapPricesForTotalCalculation() async {

    toCalculate = {
      1: double.parse(priceItem1.substring(1, priceItem1.length - 4)),
      2: double.parse(priceItem1.substring(1, priceItem1.length - 4)),
      3: double.parse(priceItem1.substring(1, priceItem1.length - 4)),

      4: double.parse(priceItem2.substring(1, priceItem2.length - 4)),
      5: double.parse(priceItem2.substring(1, priceItem2.length - 4)),
      6: double.parse(priceItem2.substring(1, priceItem2.length - 4)),

      7: double.parse(priceItem3.substring(1, priceItem3.length - 4)),
      8: double.parse(priceItem3.substring(1, priceItem3.length - 4)),
      9: double.parse(priceItem3.substring(1, priceItem3.length - 4)),

      10: double.parse(priceItem4.substring(1, priceItem4.length - 4)),
      11: double.parse(priceItem4.substring(1, priceItem4.length - 4)),
      12: double.parse(priceItem4.substring(1, priceItem4.length - 4)),

      13: double.parse(priceItem5.substring(1, priceItem5.length - 4)),
      14: double.parse(priceItem5.substring(1, priceItem5.length - 4)),
      15: double.parse(priceItem5.substring(1, priceItem5.length - 4)),

      16: double.parse(priceItem6.substring(1, priceItem6.length - 4)),
      17: double.parse(priceItem6.substring(1, priceItem6.length - 4)),
      18: double.parse(priceItem6.substring(1, priceItem6.length - 4)),
    };

  }

  Future<void> setCurrencyForTotalTo(BuildContext context, String currencyCode, String currencySymbol) async {
    const TOTAL_AMOUNT_OF_ITEMS = 18;
    Map<int,int> cartContent = await Provider.of<ItemProvider>(context, listen: false).getCartContent();

    print('setCurrencyForTotalTo: cartContent $cartContent');
    var totalAmount = 0.00;

    for (var i = 1; i < TOTAL_AMOUNT_OF_ITEMS; i++) {

      var a = cartContent[i];
      var b = toCalculate[i];
      print('setCurrencyForTotalTo: a and b: $a * $b');
      var c = a.toDouble() * b;
      totalAmount = totalAmount + c;
    }
    print('setCurrencyForTotalTo: totalAmount $totalAmount');

    totalPrice = '$currencySymbol$totalAmount $currencyCode';

    print('setCurrencyForTotalTo: totalPrice: $totalPrice');


  }


}