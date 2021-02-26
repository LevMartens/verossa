import 'package:flutter/cupertino.dart';

class BottomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        child: Center(
          child: Image(
            image: AssetImage('images/IMG_1394.jpg'),
          ),
        ),
      ),
    );
  }
}
