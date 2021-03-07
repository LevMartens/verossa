import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;



var cartBadge = 0;


class DidFinishLaunchingWithOptions {
  int futureBuilderSec = 3;
  bool cartUpdated = true;
  double screenWidth;
  

  Future<dynamic> startUp(BuildContext context) async {

    return await di.sl<AsyncMemoizer>().runOnce(() async {

      await Provider.of<ItemProvider>(context, listen: false)
          .getCartContents();
      await Provider.of<PricesProvider>(context, listen: false)
          .setCurrencyTo(context, 0);
      await Provider.of<ItemProvider>(context, listen: false)
          .getStockLimitFromFS();
      await Provider.of<ItemProvider>(context, listen: false)
          .updateCartAfterStartUp();
      await Provider.of<UserProvider>(context, listen: false).getUserFromFB();
      return Provider.of<ItemProvider>(context, listen: false)
          .addItemTilesToListAfterStartUp();
    });


  }
}