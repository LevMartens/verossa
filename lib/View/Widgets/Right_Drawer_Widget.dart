import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:provider/provider.dart';

import 'Small_Widgets/Your_Cart_Is_Empty_Widget.dart';


class RightDrawer extends StatefulWidget {
  @override
  _RightDrawerState createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {

  final GlobalKey<AnimatedListState> iListKey = GlobalKey<AnimatedListState>();
  var list = [];


  @override
  void dispose() {
    super.dispose();

  }

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    list =
        Provider.of<ItemProvider>(context, listen: true).currentItemTilesList;
    var indexToRemove = Provider.of<ItemProvider>(context, listen: true).indexToRemove;
    deleteTile(indexToRemove);


    return Drawer(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 100,
                    color: Color(0xffe7e7e7),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 7),
                            child: Opacity(
                              opacity: 0.6,
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                            ),
                          ),
                          Opacity(
                              opacity: 0.4,
                              child: Text(
                                'Continue Shopping',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                list.isEmpty ? YourCartIsEmpty() : Container(),
                Container(
                  height: 700,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: list.length,
                    itemBuilder: (context, index) {

                      return Container(
                        key: ObjectKey(list[index]),
                        child: list[index],
                      );

                    },
                  ),
                ),
              ],
            ),
          );


  }
   void deleteTile(int indexToRemove) {

     if (indexToRemove != null) {
       list.remove(list[indexToRemove]);
       Provider.of<ItemProvider>(context, listen: false).indexBackToNull();
     }
     if (list.length == 1) {
       list.remove(list[0]);
     }
     Provider.of<ItemProvider>(context, listen: false).updateTileList(list);
}

  // Widget _buildItem(BuildContext context, Widget item, Animation<double> animation) {
  //   return SizeTransition(
  //       axis: Axis.vertical,
  //       sizeFactor: animation,
  //       child: item
  //   );
  // }
  //
  // AnimatedList(
  // scrollDirection: Axis.vertical,
  // shrinkWrap: true,
  // key: iListKey,
  // initialItemCount: list.length,
  // itemBuilder: (context, index, animation) =>
  // _buildItem(context, list.isEmpty ? Container() : list[index], animation),
  // )
}
