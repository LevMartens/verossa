import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerossaLogo extends StatelessWidget {
  const VerossaLogo({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Text(
              'VERØSSA',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 4,
                  fontFamily: 'Cormorant',
                  fontWeight: FontWeight.w600,
                  fontSize: 35),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'VALLEY',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 4,
                  fontFamily: 'Cormorant',
                  fontWeight: FontWeight.w600,
                  fontSize: 35),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'PHOTOGRAPHY',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 4,
                  fontFamily: 'Cormorant',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}