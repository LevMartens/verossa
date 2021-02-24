import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'Item_Model.dart';


class ItemFactory {

  ItemModel item1 = ItemModel(
      itemIDForNormal: 1,
      itemIDForBW: 2,
      itemIDForCF:  3,
      priceAUD: 14.95,
      titleAllCaps: 'MONTANA FALL',
      title: 'Montana Fall',
      description: 'Montana Fall is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Fall.jpg'),
      itemImageBW: AssetImage('images/Verossa-FallBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-FallCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item2 = ItemModel(
      itemIDForNormal: 4,
      itemIDForBW: 5,
      itemIDForCF:  6,
      priceAUD: 24.95,
      titleAllCaps: 'RED AFRICA',
      title: 'Red Africa',
      description: 'Red Africa is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-SunTree.jpg'),
      itemImageBW: AssetImage('images/Verossa-SunTreeBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-SunTreeCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item3 = ItemModel(
      itemIDForNormal: 7,
      itemIDForBW: 8,
      itemIDForCF:  9,
      priceAUD: 19.95,
      titleAllCaps: 'BETWEEN THE ALPS',
      title: 'Between The Alps',
      description: 'Between The Alps is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Heli.jpg'),
      itemImageBW: AssetImage('images/Verossa-HeliBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-HeliCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item4 = ItemModel(
      itemIDForNormal: 10,
      itemIDForBW: 11,
      itemIDForCF:  12,
      priceAUD: 14.95,
      titleAllCaps: 'SPRING ESTONIA',
      title: 'Spring Estonia',
      description: 'Spring Estonia is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Field.jpg'),
      itemImageBW: AssetImage('images/Verossa-FieldBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-FieldCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item5 = ItemModel(
      itemIDForNormal: 13,
      itemIDForBW: 14,
      itemIDForCF:  15,
      priceAUD: 19.95,
      titleAllCaps: 'MICHIGAN THUNDER',
      title: 'Michigan Thunder',
      description: 'Michigan Thunder is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Thunder.jpg'),
      itemImageBW: AssetImage('images/Verossa-ThunderBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-ThunderCL.jpg'),
      streamController: StreamController(),
  );

  ItemModel item6 = ItemModel(
      itemIDForNormal: 16,
      itemIDForBW: 17,
      itemIDForCF:  18,
      priceAUD: 14.95,
      titleAllCaps: 'SCOTLAND HIGH',
      title: 'Scotland High',
      description: 'Scotland High is a photo taken by Paige Turner. This photo was created on November 6, 2011 and published on December 3, 2015.',
      itemImage: AssetImage('images/Verossa-Scotland.jpg'),
      itemImageBW: AssetImage('images/Verossa-ScotlandBW.jpg'),
      itemImageCF: AssetImage('images/Verossa-ScotlandCL.jpg'),
      streamController: StreamController(),
  );




}