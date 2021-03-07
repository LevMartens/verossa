import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class FollowUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 58.0),
          child: Text(
            'FOLLOW US',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Divider(
        indent: 58,
        endIndent: 58,
        color: Colors.black,
        thickness: 0.75,
      ),
      SizedBox(
        height: 8,
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  launchURL(
                      'https://www.instagram.com/levmartens/');
                },
                child: Container(
                  child: Text(
                    'Instagram',
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
                  launchURL(
                      'https://www.linkedin.com/in/lev-martens');
                },
                child: Container(
                  child: Text(
                    'Linkedin',
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
                  launchURL('https://www.facebook.com/lcmartens');
                },
                child: Container(
                  child: Text(
                    'Facebook',
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
            padding: const EdgeInsets.only(top: 14.0, left: 45.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    launchURL('https://www.facebook.com/lcmartens');
                  },
                  child: Container(
                    child: Icon(MdiIcons.facebook),
                    height: 25,
                    width: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchURL(
                        'https://www.instagram.com/levmartens/');
                  },
                  child: Container(
                    child: Icon(MdiIcons.instagram),
                    height: 25,
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],);


  }
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
