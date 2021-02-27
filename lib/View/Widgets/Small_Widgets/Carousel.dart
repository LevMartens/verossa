import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';

class CarouselHome extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<CarouselHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          height: 170.0,
          width: 500.0,
          child: Carousel(
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 1400),
            autoplayDuration: Duration(seconds: 7),
            images: [
              AssetImage('images/Verossa-Reiger.jpg'),
              AssetImage('images/Verossa-Tree.jpg'),
              AssetImage('images/Verossa-Cameraman.jpg')
            ],
            showIndicator: false,
          )),
    );
  }
}
