import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Model/Items_For_SearchDelegate.dart';
import 'package:badges/badges.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';
import 'package:provider/provider.dart';
import '../Controller/Drawer_Provider.dart';
import 'Personal_Page.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';




class MyDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> aScaffoldKey;
  MyDrawer({this.aScaffoldKey});
  @override
  _MyDrawerState createState() => _MyDrawerState(aScaffoldKey: aScaffoldKey);
}

class _MyDrawerState extends State<MyDrawer> {
  final GlobalKey<ScaffoldState> aScaffoldKey;
  _MyDrawerState({this.aScaffoldKey});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

        Provider.of<DrawerProvider>(context, listen: false).getUsersName();
        Provider.of<DrawerProvider>(context, listen: false)
            .getLogOutButton(context, aScaffoldKey);
  }

  @override
  Widget build(BuildContext context) {

    String name = Provider.of<DrawerProvider>(context, listen: true).name;
    Container logOutButton =
        Provider.of<DrawerProvider>(context, listen: true).logOutButton;




    return ChangeNotifierProvider<DrawerProvider>(
        create: (context) => DrawerProvider(),
        child: Consumer<DrawerProvider>(
            builder: (context, provider, child) =>
     Drawer(
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
            padding: const EdgeInsets.only(left: 20.0, top: 20, ),
            child: GestureDetector(

              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('homePage');
                currentlyOnPersonalPage = false;
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
          Divider(height: 0, indent: 20, color: Colors.black26,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('AboutUs');
                currentlyOnPersonalPage = false;
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
          Divider(height: 0, indent: 20, color: Colors.black26,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: GestureDetector(
              onTap: () async {

                if (await auth.currentUser != null) {
                  Navigator.pop(context);

                  Navigator.of(context).pushReplacementNamed('personalPage');

                } else {
                  Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('customerLogin');
                }
              },
              child: Container(
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
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
          Divider(height: 0, indent: 20, color: Colors.black26,),
          Container(
            child: logOutButton,
          ),
        ],
      ),
    ),
    ));
  }
}

class MyEndDrawer extends StatefulWidget {
  @override
  MyEndDrawerState createState() => MyEndDrawerState();
}

class MyEndDrawerState extends State<MyEndDrawer> {

  Widget theList = Container();


  @override
  void dispose() {
    super.dispose();

    // Future.delayed(const Duration(milliseconds: 200), () {
    //   Provider.of<AppBarProvider>(contextForBadgeProv, listen: false)
    //       .cartToCart();
    // });


    if (cartItems.isNotEmpty == true) {
      cartItems.removeLast();
    }
    flushAllCurrencyStreamsInTiles();
  }

  @override
  void initState() {
    super.initState();

    sinkCurrenciesForTiles();
    Future.delayed(const Duration(milliseconds: 1000), () {
      flushAllCurrencyStreamsInTiles();
    });


    if (cartItems.isEmpty == true) {
      cartItems.add(yourCartIsEmpty());
    } else {
      subtotalContainer = subtotal(cartSubtotal, context);
      cartItems.add(subtotalContainer);
    }

  }

  @override
  Widget build(BuildContext context) {


    theList = Container(
      height: 790,
      child: AnimatedList(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        key: listKey,
        initialItemCount: cartItems.length,
        itemBuilder: (context, index, animation) =>
            buildItem(context, cartItems[index], animation),
      ),
    );


    return ChangeNotifierProvider<DrawerProvider>(
        create: (context) => DrawerProvider(),
        child: Consumer<DrawerProvider>(
          builder: (context, provider, child) => Drawer(
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
                theList,
              ],
            ),
          ),
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? loadItems()
        : loadItems()
            .where((p) => p.subtitle.contains(query.toLowerCase()))
            .toList();

    // print(list);
    return list.isEmpty
        ? Text('No Results Found...')
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final Item listItem = list[index];
              return ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  Navigator.of(context).pushNamed(listItem.routeFromSearch);
                  // Navigator.of(context).popAndPushNamed(listItem.routeFromSearch);
                },
                title: Text(listItem.title),
                leading: Container(width: 75 ,child: listItem.image),
              );
            });
  }
}
