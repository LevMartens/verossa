import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:provider/provider.dart';

class RightDrawer extends StatefulWidget {
  @override
  _RightDrawerState createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  //Widget theList = Container();
  final GlobalKey<AnimatedListState> iListKey = GlobalKey<AnimatedListState>();
  @override
  void dispose() {
    super.dispose();

    // Future.delayed(const Duration(milliseconds: 200), () {
    //   Provider.of<AppBarProvider>(contextForBadgeProv, listen: false)
    //       .cartToCart();
    // });

    // if (cartItems.isNotEmpty == true) {
    //   cartItems.removeLast();
    // }
    // flushAllCurrencyStreamsInTiles();
  }

  @override
  void initState() {
    super.initState();

    // sinkCurrenciesForTiles();
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   flushAllCurrencyStreamsInTiles();
    // });
    //
    //
    // if (cartItems.isEmpty == true) {
    //   cartItems.add(yourCartIsEmpty());
    // } else {
    //   subtotalContainer = subtotal(cartSubtotal, context);
    //   cartItems.add(subtotalContainer);
    // }
  }

  @override
  Widget build(BuildContext context) {
    var list =
        Provider.of<ItemProvider>(context, listen: false).currentItemTilesList;

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
                Container(
                  height: 743,
                  child: AnimatedList(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    key: iListKey,
                    initialItemCount: list.length,
                    itemBuilder: (context, index, animation) =>
                        _buildItem(context, list.isEmpty ? Container() : list[index], animation),
                  ),
                ),
              ],
            ),
          );
  }
  Widget _buildItem(BuildContext context, Widget item, Animation<double> animation) {
    return SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: item
    );
  }
}
