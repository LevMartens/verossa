import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../Check_Out_Provider.dart';

class ShippingMethods extends StatefulWidget {
  @override
  _ShippingMethodsState createState() => _ShippingMethodsState();
}

class _ShippingMethodsState extends State<ShippingMethods> {
  @override
  Widget build(BuildContext context) {

    bool freeShipping = Provider.of<CheckOutProvider>(context, listen: true).freeShipping;
    bool standardShipping = Provider.of<CheckOutProvider>(context, listen: true).standardShipping;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
        child: Row(
          children: [
            Text('Method', style: TextStyle(fontWeight: FontWeight.w300),),
            Spacer(),
            freeShipping == false ? GestureDetector(
              onTap: () {
                if (standardShipping == true ){
                  Provider.of<CheckOutProvider>(context, listen: false).setStandardShippingTo(false);
                  Provider.of<CheckOutProvider>(context, listen: false).setExpressShippingTo(true);
                  Provider.of<CheckOutProvider>(context, listen: false).setTotalPriceForSummary(context);
                  Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
                } else {
                  Provider.of<CheckOutProvider>(context, listen: false).setStandardShippingTo(true);
                  Provider.of<CheckOutProvider>(context, listen: false).setExpressShippingTo(false);
                  Provider.of<CheckOutProvider>(context, listen: false).setTotalPriceForSummary(context);
                  Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
                }
              },
              child: Text('Change'),
            ) : Container(),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
        child: GestureDetector(
            child: freeShipping == true ? Row(
              children: [
                Text('Free Shipping:'),
                SizedBox(width: 5,),
                Text('\$0.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ) : standardShipping == true ? Row(
              children: [
                Text('Standard Shipping:'),
                SizedBox(width: 5,),
                Text('\$9.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ) : Row(
              children: [
                Text('Express Shipping'),
                SizedBox(width: 5,),
                Text('\$15.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            )

        ),
      ),
    ],);
  }
}
