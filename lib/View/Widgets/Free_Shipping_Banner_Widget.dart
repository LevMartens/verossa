
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeShippingBanner extends StatelessWidget {
  const FreeShippingBanner({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'FREE SHIPPING ON ORDERS OVER \$150',
          style: TextStyle(
              color: Colors.white60, fontWeight: FontWeight.bold),
        ),
      ),
      color: Colors.black,
      height: 25,
      width: 900,
    );
  }
}