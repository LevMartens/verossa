import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';

import '../../Check_Out_Provider.dart';
import 'Discount_Applied_Widget.dart';

class SummarySubtotal extends StatefulWidget {
  @override
  _SummarySubtotalState createState() => _SummarySubtotalState();
}

class _SummarySubtotalState extends State<SummarySubtotal> {


  @override
  Widget build(BuildContext context) {
    bool discountApplied = Provider.of<CheckOutProvider>(context, listen: true).discountApplied;
    bool freeShipping = Provider.of<CheckOutProvider>(context, listen: true).freeShipping;
    bool standardShipping = Provider.of<CheckOutProvider>(context, listen: true).standardShipping;
    String totalPrice = Provider.of<PricesProvider>(context, listen: true).totalPrice;

    return Container(
      height: discountApplied == true ? 90 : 80,
      child: Column(
        children: [
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7),
            child: Row(
              children: [
                Text('Subtotal'),
                Spacer(),
                Text(totalPrice, style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(width: 15,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7),
            child: freeShipping == true ? Row(
              children: [
                Text('Free shipping'),
                Spacer(),
                Text('\$0.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(width: 15,)
              ],
            ) : standardShipping == true ? Row(
              children: [
                Text('Shipping'),
                Spacer(),
                Text('\$9.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(width: 15,)
              ],
            ) : Row(
              children: [
                Text('Express shipping'),
                Spacer(),
                Text('\$15.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(width: 15,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7),
            child: discountApplied == true ? DiscountApplied() : Row(),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
