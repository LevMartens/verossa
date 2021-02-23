import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';

import 'dart:async';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Util/Input_Converter.dart';

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



  String currentlySelected = 'item1Small';



  ItemProvider({

    @required ItemFactory factory,

  })  : assert(factory != null),

        factory = factory;

void setupProviderForItem(ItemModel itemModel) {
  imageFirst = HeroContainer(assetImage: itemModel.itemImage);
  imageSecond = HeroContainer(assetImage: itemModel.itemImageBW);
  print('first image $imageFirst');
  }


  void displayFirstImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageA == true) {
    } else {
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
    if (onImageB == true) {
    } else {
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

  void displayThirdImage(HeroContainer a, HeroContainer b, HeroContainer c){
    if (onImageC == true) {
    } else {
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
}
