import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Widget.dart';



class VerossaAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> aScaffoldKey;

  VerossaAppBar({this.aScaffoldKey, Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _VerossaAppBarState createState() => _VerossaAppBarState(aScaffoldKey: aScaffoldKey);
}

class _VerossaAppBarState extends State<VerossaAppBar> {
  final GlobalKey<ScaffoldState> aScaffoldKey;

  _VerossaAppBarState({this.aScaffoldKey});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => aScaffoldKey.currentState.openDrawer(),
              ),
              title: Row(
                children: [
                  Text(
                    'MENU',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
              actions: <Widget>[
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        aScaffoldKey.currentState.openEndDrawer();
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: CartBadgeWidget(),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 0.0, right: 15),
                            child: Text(
                              'CART',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
              titleSpacing: 0.0,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
            );
  }
}


