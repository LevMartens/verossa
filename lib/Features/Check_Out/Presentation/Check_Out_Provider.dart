import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Prices/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';



class CheckOutProvider extends ChangeNotifier {

  final ItemFactory factory;
  final InputConverter inputConverter;
  bool discountApplied;
  bool freeShipping;
  bool standardShipping;
  bool expressShipping;
  double extentSliver;
  bool allFormsAreCompleted = false;
  double containerHeightWhenUserLoggedInAndFormShowing = 620;


  CheckOutProvider({
    @required this.factory,
    @required this.inputConverter,
  })  : assert(factory != null),
        assert(inputConverter != null);


  void setDiscountApplied(bool bool) {
    discountApplied = bool;
  }
  void setContainerHeightWhenUserLoggedInAndFormShowing(double double) {
    containerHeightWhenUserLoggedInAndFormShowing = double;
  }
  void setAllFormsAreCompleted(bool bool) {
    allFormsAreCompleted = bool;
  }

  void setFreeShippingTo(bool bool) {
    freeShipping = bool;
  }
  void setStandardShippingTo(bool bool) {
    standardShipping = bool;
  }
  void setExpressShippingTo(bool bool) {
    expressShipping = bool;
  }

  void setTotalPriceForSummary(BuildContext context) {
    Provider.of<PricesProvider>(context, listen: false).setTotalPriceForCheckOutSummary(freeShipping, standardShipping, expressShipping);
  }

  void extendSliverWith(double height) {
    extentSliver = height;
  }
  void notifyCheckOutListeners() {
    notifyListeners();
  }






}