import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:verossa/View/Pages/Checkout/Check_Out_Page.dart';
import 'Prices_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';



class Checkout extends StatefulWidget implements DrawerObject {
  @override
  _CheckoutState createState() => _CheckoutState();

}

class _CheckoutState extends State<Checkout> {
  final textControllerCheckOut = TextEditingController();
  @override
  Widget build(BuildContext context) {

    String totalAmount = Provider.of<PricesProvider>(context, listen: true).totalPrice;
    return Container(
      child: Column(
        children: [
          Container(
            color: Color(0xffe7e7e7),
            height: 40,
            child: Padding(
              padding: EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Opacity(
                      opacity: 0.8,
                      child: Text(
                        'SUBTOTAL',
                        style:
                        TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 90.0),
                    child: Text(totalAmount),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 20, right: 15, bottom: 20),
              child: Opacity(
                opacity: 0.4,
                child: TextFormField(
                  controller: textControllerCheckOut,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Order Notes',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Container(
                width: 240,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xff3d3939),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    // Save order notes here
                    textControllerCheckOut.text = '';

                    var response = await Provider.of<ItemProvider>(context, listen: false).buildCheckoutSummary();
                    Provider.of<CheckOutProvider>(context, listen: false).setStandardShippingTo(true);
                    await Provider.of<PricesProvider>(context, listen: false)
                        .setCurrencyTo(context, 0);
                    Provider.of<CheckOutProvider>(context, listen: false).setTotalPriceForSummary(context);

                    Navigator.pushReplacement(context, new MaterialPageRoute(
                        builder: (context) =>
                            CheckOutPage(summaryDDItems: response)));

                  },
                  child: Text(
                    'CHECKOUT',
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
              width: 240,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('All transactions are processed in AUD', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
              )),
        ],
      ),
    );
  }
}
