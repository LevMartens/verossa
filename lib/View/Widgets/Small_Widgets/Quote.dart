import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(

          child: Text(

            '\"The journey of a thousand miles begins with a single step.\"',

            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w200, fontSize: 24),
          ),
          width: 360,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            '― Lao Tzu',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
          width: 250,
        ),
        Center(
          child: Image(
            height: 70,
            width: 100,
            image: AssetImage('images/VerossaSmallLogo.jpg'),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}
