import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Old_Architecture/View/AboutUs_Page.dart';
import 'package:verossa/Old_Architecture/View/ContactUs_Page.dart';
import 'package:verossa/Old_Architecture/View/ReturnsPolicy_Page.dart';
import 'package:verossa/Old_Architecture/View/Shipping_Page.dart';

class MoreInfo extends StatelessWidget {
  final ScrollController scrollController;

  MoreInfo({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        transitionDuration:
                        Duration(milliseconds: 200),
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>
                            ContactUs()));
                scrollController.jumpTo(0);
              },
              child: Container(
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                height: 25,
                width: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        transitionDuration:
                        Duration(milliseconds: 200),
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>
                            AboutUs()));
                scrollController.jumpTo(0);
              },
              child: Container(
                child: Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                height: 25,
                width: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        transitionDuration:
                        Duration(milliseconds: 200),
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>
                            ReturnsPolicy()));
                scrollController.jumpTo(0);
              },
              child: Container(
                child: Text(
                  'Returns Policy',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                height: 25,
                width: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                        transitionDuration:
                        Duration(milliseconds: 200),
                        pageBuilder: (context, animation,
                            secondaryAnimation) =>
                            Shipping()));
                scrollController.jumpTo(0);
              },
              child: Container(
                child: Text(
                  'Shipping',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                height: 25,
                width: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
