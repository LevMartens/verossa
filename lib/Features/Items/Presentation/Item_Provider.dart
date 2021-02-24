import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';


import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'Item_Factory.dart';
import 'Util/Hero_Container_Widget.dart';

class ItemProvider extends ChangeNotifier {
  final ItemFactory factory;


  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;

  bool startImageOne = false;
  bool onImageA = true;
  bool onImageB = false;
  bool onImageC = false;


  HeroContainer imageFirst;
  HeroContainer imageSecond;

  Map<int,int> stockLimits;
  Map<int,int> cartContentMap;
  Map<int, int> setupMap = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
    10: 0,
    11: 0,
    12: 0,
    13: 0,
    14: 0,
    15: 0,
    16: 0,
    17: 0,
    18: 0,
  };


  final GetItemsFromCart getItemsFromCart;
  final SetItemsToCart setItemsToCart;
  final InputConverter inputConverter;

  ItemProvider({
    @required ItemFactory factory,
    @required GetItemsFromCart getItemsFromCart,
    @required SetItemsToCart setItemsToCart,
    @required this.inputConverter,
  })
      : assert(factory != null),
        assert(getItemsFromCart != null),
        assert(setItemsToCart != null),
        assert(inputConverter != null),
        factory = factory,
        getItemsFromCart = getItemsFromCart,
        setItemsToCart = setItemsToCart;


  void setupProviderForItem(ItemModel itemModel) {
    imageFirst = HeroContainer(assetImage: itemModel.itemImage);
    imageSecond = HeroContainer(assetImage: itemModel.itemImageBW);
    print('first image $imageFirst');
  }

  void displayFirstImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageA == true) {} else {
      onImageA = true;
      onImageB = false;
      onImageC = false;

      opacityOne = 1.0;
      opacityTwo = 0.7;
      opacityThree = 0.7;
      //opacityFour = 0.7;

      if (startImageOne == false) {
        imageSecond = a;
        startImageOne = true;
        notifyListeners();
      } else {
        imageFirst = a;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  void displaySecondImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageB == true) {} else {
      onImageA = false;
      onImageB = true;
      onImageC = false;

      opacityOne = 0.7;
      opacityTwo = 1.0;
      opacityThree = 0.7;
      //opacityFour = 0.7;
      if (startImageOne == false) {
        //load up second image
        imageSecond = b;
        startImageOne = true;
        notifyListeners();
      } else {
        //load up first image
        imageFirst = b;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  void displayThirdImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageC == true) {} else {
      onImageA = false;
      onImageB = false;
      onImageC = true;
      opacityOne = 0.7;
      opacityTwo = 0.7;
      opacityThree = 1.0;
      //opacityFour = 0.7;
      if (startImageOne == false) {
        imageSecond = c;
        startImageOne = true;
        notifyListeners();
      } else {
        print('B');
        imageFirst = c;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  Future<void> setupCart() async {
    final failureOrCartContent = await getItemsFromCart(NoParams());
    final newCartContent = failureOrCartContent.fold((failure) => 'No Map', (
        cart) => cart.map);

    if (newCartContent == 'No Map') {

      setItemsToCart(Params(map: setupMap));
      cartContentMap = setupMap;

    } else {
      cartContentMap = newCartContent;
    }
  }

  Future<Map<int,int>> getCartContent() async {
    final failureOrCartContent = await getItemsFromCart(NoParams());
    final newCartContent = failureOrCartContent.fold((failure) => {}, (cart) => cart.map);

    if (newCartContent == {}) {
      setupCart();
    }
    return newCartContent;
  }

  String addItemToCart(int itemID) {

    if (cartContentMap[itemID] >=
        stockLimit[itemID]) {
      // _scaffoldKey.currentState.showSnackBar(SnackBar(
      //     content: Text(
      //       'Item sold out',
      //       textAlign: TextAlign.center,
      //     )));

      return 'Sold Out';
    } else {
      //addCartItem(currentlySelected, false, context);
    }
    return 'Sold Out';
  }



}

