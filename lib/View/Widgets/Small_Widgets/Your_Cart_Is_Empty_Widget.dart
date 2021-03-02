import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourCartIsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 400,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.only(top: 14.0, left: 40),
        child: Opacity(
            opacity: 1,
            child: Text(
              'YOUR CART IS EMPTY',
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w300),
            )),
      ),
    );
  }
}
