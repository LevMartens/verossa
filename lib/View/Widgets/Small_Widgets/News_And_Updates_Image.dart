import 'package:flutter/cupertino.dart';

class NewsAndUpdateImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        child: Center(
          child: Image(
            image: AssetImage('images/IMG_1368.jpg'),
          ),
        ),
      ),
    );
  }
}
