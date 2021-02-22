import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../Model/Items.dart';

class ItemFactory {

  ItemModel item1 = ItemModel(
      itemIDForNormal: 001,
      itemIDForBW: 002,
      itemIDForCF:  003,
      title: 'Montana Fall',
      description: 'Montana Fall is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Fall.jpg'),
      itemImageBW: AssetImage('images/Verossa-FallBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-FallCL.jpg'),
      streamController: StreamController(),
  );






}