import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Features/User_Auth/Presentation/Name_Or_Login_In_Left_Drawer_Widget.dart';
import 'Search_Items_Widget.dart';

class LeftDrawer extends StatefulWidget {

  @override
  _LeftDrawerState createState() =>
      _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {


  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Container(
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            indent: 20,
            color: Colors.black26,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('AboutUs');
              },
              child: Container(
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            indent: 20,
            color: Colors.black26,
          ),
          NameOrLogin(),
        ],
      ),
    );
  }
}
