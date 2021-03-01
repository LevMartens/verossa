import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'Item_Model.dart';


class ItemFactory {

  ItemModel item1 = ItemModel(
      itemNumber: '1',
      route: 'ItemPage1',
      itemIDForNormal: 1,
      itemIDForBW: 2,
      itemIDForCF:  3,
      priceAUD: 14.95,
      titleAllCaps: 'MONTANA FALL',
      title: 'Montana Fall',
      subtitle: 'montana fall',
      description: 'Montana Fall is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Fall.jpg'),
      itemImageBW: AssetImage('images/Verossa-FallBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-FallCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item2 = ItemModel(
      itemNumber: '2',
      route: 'ItemPage2',
      itemIDForNormal: 4,
      itemIDForBW: 5,
      itemIDForCF:  6,
      priceAUD: 24.95,
      titleAllCaps: 'RED AFRICA',
      title: 'Red Africa',
      subtitle: 'red africa',
      description: 'Red Africa is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-SunTree.jpg'),
      itemImageBW: AssetImage('images/Verossa-SunTreeBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-SunTreeCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item3 = ItemModel(
      itemNumber: '3',
      route: 'ItemPage3',
      itemIDForNormal: 7,
      itemIDForBW: 8,
      itemIDForCF:  9,
      priceAUD: 19.95,
      titleAllCaps: 'BETWEEN THE ALPS',
      title: 'Between The Alps',
      subtitle: 'between the alps',
      description: 'Between The Alps is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Heli.jpg'),
      itemImageBW: AssetImage('images/Verossa-HeliBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-HeliCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item4 = ItemModel(
      itemNumber: '4',
      route: 'ItemPage4',
      itemIDForNormal: 10,
      itemIDForBW: 11,
      itemIDForCF:  12,
      priceAUD: 14.95,
      titleAllCaps: 'SPRING ESTONIA',
      title: 'Spring Estonia',
      subtitle: 'spring estonia',
      description: 'Spring Estonia is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Field.jpg'),
      itemImageBW: AssetImage('images/Verossa-FieldBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-FieldCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item5 = ItemModel(
      itemNumber: '5',
      route: 'ItemPage5',
      itemIDForNormal: 13,
      itemIDForBW: 14,
      itemIDForCF:  15,
      priceAUD: 19.95,
      titleAllCaps: 'MICHIGAN THUNDER',
      title: 'Michigan Thunder',
      subtitle: 'michigan thunder',
      description: 'Michigan Thunder is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Thunder.jpg'),
      itemImageBW: AssetImage('images/Verossa-ThunderBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-ThunderCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item6 = ItemModel(
      itemNumber: '6',
      route: 'ItemPage6',
      itemIDForNormal: 16,
      itemIDForBW: 17,
      itemIDForCF:  18,
      priceAUD: 14.95,
      titleAllCaps: 'SCOTLAND HIGH',
      title: 'Scotland High',
      subtitle: 'scotland high',
      description: 'Scotland High is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Scotland.jpg'),
      itemImageBW: AssetImage('images/Verossa-ScotlandBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-ScotlandCL.jpg'),
      streamController: StreamController(),
  );


  Map<String,dynamic> getItemModelWithID(int itemID) {

      switch (itemID) {
          case 1:
              return {
                  'itemModel': item1,
                  'itemFilter': 'Normal'
              };
              break;

          case 2:
              return {
                  'itemModel': item1,
                  'itemFilter': 'BW'
              };
              break;

          case 3:
              return {
                  'itemModel': item1,
                  'itemFilter': 'CF'
              };
              break;

          case 4:
              return {
                  'itemModel': item2,
                  'itemFilter': 'Normal'
              };
              break;

          case 5:
              return {
                  'itemModel': item2,
                  'itemFilter': 'BW'
              };
              break;

          case 6:
              return {
                  'itemModel': item2,
                  'itemFilter': 'CF'
              };
              break;

          case 7:
              return {
                  'itemModel': item3,
                  'itemFilter': 'Normal'
              };
              break;

          case 8:
              return {
                  'itemModel': item3,
                  'itemFilter': 'BW'
              };
              break;

          case 9:
              return {
                  'itemModel': item3,
                  'itemFilter': 'CF'
              };
              break;
          case 10:
              return {
                  'itemModel': item4,
                  'itemFilter': 'Normal'
              };
              break;

          case 11:
              return {
                  'itemModel': item4,
                  'itemFilter': 'BW'
              };
              break;

          case 12:
              return {
                  'itemModel': item4,
                  'itemFilter': 'CF'
              };
              break;
          case 13:
              return {
                  'itemModel': item5,
                  'itemFilter': 'Normal'
              };
              break;

          case 14:
              return {
                  'itemModel': item5,
                  'itemFilter': 'BW'
              };
              break;

          case 15:
              return {
                  'itemModel': item5,
                  'itemFilter': 'CF'
              };
              break;

          case 16:
              return {
                  'itemModel': item6,
                  'itemFilter': 'Normal'
              };
              break;

          case 17:
              return {
                  'itemModel': item6,
                  'itemFilter': 'BW'
              };
              break;

          case 18:
              return {
                  'itemModel': item6,
                  'itemFilter': 'CF'
              };
              break;
      }
  }



}