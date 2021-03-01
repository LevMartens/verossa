//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';



class CartBadgeProvider extends ChangeNotifier {
  final SetCartBadgeNumber setCartBadgeNumber;
  final GetCartBadgeNumber getCartBadgeNumber;
  final InputConverter inputConverter;
  int cartBadgeCount = 0;
  int TOTAL_AMOUNT_OF_ITEMS = 18;

  CartBadgeProvider({
    @required GetCartBadgeNumber count,
    @required SetCartBadgeNumber number,
    @required this.inputConverter,
  })  : assert(count != null),
        assert(number != null),
        assert(inputConverter != null),
        setCartBadgeNumber = number,
        getCartBadgeNumber = count;





  void updateCartBadgeCountWith(Map<int,int> cartContents) async {
    print('lengt ${cartContents.length}');
    var totalItemInCart = 0;
    for (var i = 1; i < TOTAL_AMOUNT_OF_ITEMS; i++) {
      var b = cartContents[i];
      var c = totalItemInCart + b;
      totalItemInCart = c;
    }

     setCartBadgeNumber(Params(number: totalItemInCart));
    
     cartBadgeCount = totalItemInCart;
         
     notifyListeners();
  }

  void getLastCardBadgeCount() async {

    final failureOrCartBadgeNumber = await getCartBadgeNumber(NoParams());
    final lastCartBadgeCount = failureOrCartBadgeNumber.fold((failure) => 0, (cartBadgeNumber) => cartBadgeNumber.number);

    cartBadgeCount = lastCartBadgeCount;

    notifyListeners();
  }
}