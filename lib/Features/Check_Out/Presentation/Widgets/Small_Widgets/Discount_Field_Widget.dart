import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';

import '../../Check_Out_Provider.dart';

class DiscountField extends StatefulWidget {

  @override
  _DiscountFieldState createState() => _DiscountFieldState();
}

class _DiscountFieldState extends State<DiscountField> {


  final _textController = TextEditingController();
  final discountCode = 'discount';


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 800,
      color: Colors.transparent,
      child: Form(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
              child: Container(
                width: 300,
                height: 50,
                child: TextFormField(
                  maxLines: 1,
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Gift card or discount code',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              height: 48,
              width: 70,
              child: TextButton(
                onPressed: () {

                  if (_textController.text == discountCode) {
                    Provider.of<CheckOutProvider>(context, listen: false).setDiscountApplied(true);
                    Provider.of<PricesProvider>(context, listen: false).applyDiscountToTotalPrice();
                  }

                },
                child: Icon(Icons.arrow_forward, color: Colors.white,),
              ),
            ),
            SizedBox(width: 15,)
          ],
        ),
      ),
    );
  }
}
