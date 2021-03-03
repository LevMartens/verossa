import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'dart:async';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Prices/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';



class PricesProvider extends ChangeNotifier {

   final GetExchangeRates getExchangeRates;
   final InputConverter inputConverter;
   final ItemFactory itemFactory;

   ItemModel currentItemModel;

   String itemPriceForThisWidget;

   String priceItem1;
   String priceItem2;
   String priceItem3;
   String priceItem4;
   String priceItem5;
   String priceItem6;

   String currencySymbol;
   String currencyCode;
   String totalPrice;
   String totalPriceForCheckOutSummary;

   Map<int, double> toCalculate;

  PricesProvider({
    @required GetExchangeRates rates,
    @required this.itemFactory,
    @required this.inputConverter,
   })  : assert(itemFactory != null),
         assert(rates != null),
         assert(inputConverter != null),
         getExchangeRates = rates;


  Future<void> setCurrencyTo(BuildContext context, int currencyIndex) async {



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

    switch (currencyIndex) {

      case 0 :
        currencyCode = 'AUD';
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem2 = '\$${(item2AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem3 = '\$${(item3AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem4 = '\$${(item4AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem5 = '\$${(item5AUD * rateAUD).toStringAsFixed(2)} AUD';
        priceItem6 = '\$${(item6AUD * rateAUD).toStringAsFixed(2)} AUD';

        break;

      case 1:
        currencyCode = 'USD';
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem2 = '\$${(item2AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem3 = '\$${(item3AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem4 = '\$${(item4AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem5 = '\$${(item5AUD * rateUSD).toStringAsFixed(2)} USD';
        priceItem6 = '\$${(item6AUD * rateUSD).toStringAsFixed(2)} USD';

        break;

      case 2:
        currencyCode = 'CAD';
        currencySymbol = '\$';
        priceItem1 = '\$${(item1AUD * rateCAN).toStringAsFixed(2)} CAD';
        priceItem2 = '\$${(item2AUD * rateCAN).toStringAsFixed(2)} CAD';
        priceItem3 = '\$${(item3AUD * rateCAN).toStringAsFixed(2)} CAD';
        priceItem4 = '\$${(item4AUD * rateCAN).toStringAsFixed(2)} CAD';
        priceItem5 = '\$${(item5AUD * rateCAN).toStringAsFixed(2)} CAD';
        priceItem6 = '\$${(item6AUD * rateCAN).toStringAsFixed(2)} CAD';
        break;

      case 3:
        currencyCode = 'INR';
        currencySymbol = '\₹';
        priceItem1 = '\₹${(item1AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem2 = '\₹${(item2AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem3 = '\₹${(item3AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem4 = '\₹${(item4AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem5 = '\₹${(item5AUD * rateINR).toStringAsFixed(2)} INR';
        priceItem6 = '\₹${(item6AUD * rateINR).toStringAsFixed(2)} INR';
        break;

      case 4:
        currencyCode = 'GBP';
        currencySymbol = '\£';
        priceItem1 = '\£${(item1AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem2 = '\£${(item2AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem3 = '\£${(item3AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem4 = '\£${(item4AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem5 = '\£${(item5AUD * rateGBP).toStringAsFixed(2)} GBP';
        priceItem6 = '\£${(item6AUD * rateGBP).toStringAsFixed(2)} GBP';
        break;

      case 4:
        currencyCode = 'EUR';
        currencySymbol = '\€';
        priceItem1 = '\€${(item1AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem2 = '\€${(item2AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem3 = '\€${(item3AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem4 = '\€${(item4AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem5 = '\€${(item5AUD * rateEUR).toStringAsFixed(2)} EUR';
        priceItem6 = '\€${(item6AUD * rateEUR).toStringAsFixed(2)} EUR';
        break;

      case 5:
        currencyCode = 'JPY';
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
    await setCurrencyForTotalTo(context);
    if (currentItemModel != null) {
      await setThisPriceForCurrentWidget(currentItemModel);
    }


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

  Future<void> setCurrencyForTotalTo(BuildContext context) async {
    await mapPricesForTotalCalculation();

    Map<int,int> cartContent = await Provider.of<ItemProvider>(context, listen: false).returnCartContent();

    var totalAmount = 0.00;

    for (var i = 1; i < cartContent.length; i++) {

      var a = cartContent[i];
      var b = toCalculate[i];
      var c = a.toDouble() * b;
      totalAmount = totalAmount + c;
    }

    if (currencyCode == 'AUD' && totalAmount > 150) {
      Provider.of<CheckOutProvider>(context, listen: false).setFreeShippingTo(true);
    }

    var totalAmountFixed = totalAmount.toStringAsFixed(2);

    totalPrice = '$currencySymbol$totalAmountFixed $currencyCode';

    notifyListeners();


  }

  Future<void> setThisPriceForCurrentWidget(ItemModel itemModel) async {

    currentItemModel = itemModel;

    String itemTitle = itemModel.title;

    switch (itemTitle) {

      case 'Montana Fall':
        itemPriceForThisWidget = priceItem1;
        break;

      case 'Red Africa':
        itemPriceForThisWidget = priceItem2;

        break;

      case 'Between The Alps':
        itemPriceForThisWidget = priceItem3;
        break;

      case 'Spring Estonia':
        itemPriceForThisWidget = priceItem4;
        break;

      case 'Michigan Thunder':
        itemPriceForThisWidget = priceItem5;
        break;

      case 'Scotland High':
        itemPriceForThisWidget = priceItem6;
        break;

    }

  }

  String getItemPriceForTile(String itemNumber) {
     switch (itemNumber) {
       case '1':
         return priceItem1;
         break;

       case '2':
         return priceItem2;
         break;

       case '3':
         return priceItem3;
         break;

       case '4':
         return priceItem4;
         break;

       case '5':
         return priceItem5;
         break;

       case '6':
         return priceItem6;
         break;

     }

   }

  void applyDiscountToTotalPrice() {
      var a = totalPrice.substring(1, totalPrice.length - 4);
      var b = double.parse(a);
      var c = b * 0.9;
      totalPrice = '$currencySymbol${c.toStringAsFixed(2)} $currencyCode';
      notifyListeners();
  }

  void setTotalPriceForCheckOutSummary(bool freeShipping, bool standardShipping, bool expressShipping) {
    var a = totalPrice.substring(1, totalPrice.length - 4);
    var checkTotal = int.parse(a);
    if (freeShipping != true) {
      if (expressShipping == true) {
        checkTotal = checkTotal + 15;
      }
      if (standardShipping == true) {
        checkTotal = checkTotal + 9;
      }
      if (freeShipping == false && standardShipping == false) {
        //standard shipping costs will be added when no shipping details are provided
        checkTotal = checkTotal + 9;
      }
    }
    totalPriceForCheckOutSummary = '$currencyCode${checkTotal.toStringAsFixed(2)} $currencyCode';
    notifyListeners();
  }


}