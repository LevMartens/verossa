import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'Prices_Provider.dart';



class Checkout extends StatefulWidget implements DrawerObject {
  @override
  _CheckoutState createState() => _CheckoutState();

  @override
   int id;
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
                    // orderNotes = textControllerCheckOut.text;
                    // textControllerCheckOut.text = '';
                    // print('first: $cartSubtotal');
                    // await getCurrencyData(0);
                    // print('second: $cartSubtotal');
                    //
                    // await fillList();
                    //
                    // bool userLoggedIn;
                    //
                    // if (auth.currentUser != null ) {
                    //   print('user signed in');
                    //   userLoggedIn = true;
                    // } else {
                    //   print('user signed out');
                    //   userLoggedIn = false;
                    // }
                    //
                    // Navigator.pushReplacement(context, new MaterialPageRoute(
                    //     builder: (context) =>
                    //         PreCheckOut(dropdownMenuItems: dropdownItems, userIsLoggedIn: userLoggedIn, )));

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
