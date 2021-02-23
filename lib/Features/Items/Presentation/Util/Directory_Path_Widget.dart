import 'package:flutter/cupertino.dart';

class DirectoryPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('homePage');
                //_scrollController.jumpTo(0);
              },
              child: Text('Home'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text('/'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: Text('NEW PRINTS'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text('/'),
          ),
          Text('Montana Fall'),
        ],
      ),
    );
  }
}
