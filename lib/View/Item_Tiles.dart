import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';


///------------------------------------------------ 1
class ItemTile1S extends StatefulWidget {

  
  final String itemID;
  ItemTile1S({this.itemID});
   
  @override
  _ItemTile1SState createState() => _ItemTile1SState(itemID: itemID);
}

class _ItemTile1SState extends State<ItemTile1S> {

  String itemID;
  
  TextEditingController _textController = TextEditingController();

  _ItemTile1SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    
    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;
    
    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });
    
    
    _textController.text = stockInCart[itemID].toString();
    

    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');
                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  //});
  }
}

class ItemTile1M extends StatefulWidget {


  final String itemID;
  ItemTile1M({this.itemID});

  @override
  _ItemTile1MState createState() => _ItemTile1MState(itemID: itemID);
}

class _ItemTile1MState extends State<ItemTile1M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile1MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile1L extends StatefulWidget {


  final String itemID;
  ItemTile1L({this.itemID});

  @override
  _ItemTile1LState createState() => _ItemTile1LState(itemID: itemID);
}

class _ItemTile1LState extends State<ItemTile1L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile1LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}
///------------------------------------------------ 2

class ItemTile2S extends StatefulWidget {


  final String itemID;
  ItemTile2S({this.itemID});

  @override
  _ItemTile2SState createState() => _ItemTile2SState(itemID: itemID);
}

class _ItemTile2SState extends State<ItemTile2S> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile2SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile2M extends StatefulWidget {


  final String itemID;
  ItemTile2M({this.itemID});

  @override
  _ItemTile2MState createState() => _ItemTile2MState(itemID: itemID);
}

class _ItemTile2MState extends State<ItemTile2M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile2MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile2L extends StatefulWidget {


  final String itemID;
  ItemTile2L({this.itemID});

  @override
  _ItemTile2LState createState() => _ItemTile2LState(itemID: itemID);
}

class _ItemTile2LState extends State<ItemTile2L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile2LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

///------------------------------------------------ 3
class ItemTile3S extends StatefulWidget {


  final String itemID;
  ItemTile3S({this.itemID});

  @override
  _ItemTile3SState createState() => _ItemTile3SState(itemID: itemID);
}

class _ItemTile3SState extends State<ItemTile3S> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile3SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile3M extends StatefulWidget {


  final String itemID;
  ItemTile3M({this.itemID});

  @override
  _ItemTile3MState createState() => _ItemTile3MState(itemID: itemID);
}

class _ItemTile3MState extends State<ItemTile3M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile3MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile3L extends StatefulWidget {


  final String itemID;
  ItemTile3L({this.itemID});

  @override
  _ItemTile3LState createState() => _ItemTile3LState(itemID: itemID);
}

class _ItemTile3LState extends State<ItemTile3L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile3LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

///------------------------------------------------ 4
class ItemTile4S extends StatefulWidget {


  final String itemID;
  ItemTile4S({this.itemID});

  @override
  _ItemTile4SState createState() => _ItemTile4SState(itemID: itemID);
}

class _ItemTile4SState extends State<ItemTile4S> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile4SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile4M extends StatefulWidget {


  final String itemID;
  ItemTile4M({this.itemID});

  @override
  _ItemTile4MState createState() => _ItemTile4MState(itemID: itemID);
}

class _ItemTile4MState extends State<ItemTile4M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile4MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile4L extends StatefulWidget {


  final String itemID;
  ItemTile4L({this.itemID});

  @override
  _ItemTile4LState createState() => _ItemTile4LState(itemID: itemID);
}

class _ItemTile4LState extends State<ItemTile4L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile4LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}
///------------------------------------------------ 5
class ItemTile5S extends StatefulWidget {


  final String itemID;
  ItemTile5S({this.itemID});

  @override
  _ItemTile5SState createState() => _ItemTile5SState(itemID: itemID);
}

class _ItemTile5SState extends State<ItemTile5S> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile5SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile5M extends StatefulWidget {


  final String itemID;
  ItemTile5M({this.itemID});

  @override
  _ItemTile5MState createState() => _ItemTile5MState(itemID: itemID);
}

class _ItemTile5MState extends State<ItemTile5M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile5MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile5L extends StatefulWidget {


  final String itemID;
  ItemTile5L({this.itemID});

  @override
  _ItemTile5LState createState() => _ItemTile5LState(itemID: itemID);
}

class _ItemTile5LState extends State<ItemTile5L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile5LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}
///------------------------------------------------ 6
class ItemTile6S extends StatefulWidget {


  final String itemID;
  ItemTile6S({this.itemID});

  @override
  _ItemTile6SState createState() => _ItemTile6SState(itemID: itemID);
}

class _ItemTile6SState extends State<ItemTile6S> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile6SState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile6M extends StatefulWidget {


  final String itemID;
  ItemTile6M({this.itemID});

  @override
  _ItemTile6MState createState() => _ItemTile6MState(itemID: itemID);
}

class _ItemTile6MState extends State<ItemTile6M> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile6MState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}

class ItemTile6L extends StatefulWidget {


  final String itemID;
  ItemTile6L({this.itemID});

  @override
  _ItemTile6LState createState() => _ItemTile6LState(itemID: itemID);
}

class _ItemTile6LState extends State<ItemTile6L> {

  String itemID;

  TextEditingController _textController = TextEditingController();

  _ItemTile6LState({this.itemID});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    String itemName = itemTitles[itemID];
    AssetImage itemImage = itemImages[itemID];

    double containerHeight = 110;

    sinkCurrenciesForTiles();

    Future.delayed(const Duration(milliseconds: 200), () {
      flushAllCurrencyStreamsInTiles();
    });


    _textController.text = stockInCart[itemID].toString();


    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: containerHeight,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image: itemImage),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        child: Text(itemName),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:
                      StreamBuilder(
                        stream: streamControllers[itemID].stream,
                        builder: (context, snapshot) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          );
                        },
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print('remove pressed');


                                subtractItemStock(
                                    itemID, context);

                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {

                                  });
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 7, right: 7, top: 8.0),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                print('onChanged Tapped');


                                var a = int.parse(value);
                                if (a > stockLimit[itemID]) {
                                  Scaffold.of(context)
                                      .showSnackBar(SnackBar(
                                      content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                } else {

                                  onChangedItemStock(itemID, a, context);

                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    setState(() {
                                      ///This is to update the item count in the textField.
                                    });
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: _textController,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(fontSize: 13),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              print('add tapped');


                              var a = int.parse(_textController.text);

                              if (a == stockLimit[itemID]) {
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Maximum stock reached, cart adjusted', textAlign: TextAlign.center,)));

                              } else {
                                addCartItem(itemID, true, context);
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  setState(() {
                                    print(
                                        'stockInCart[itemID] during setstate = ${stockInCart[itemID]}');
                                  });
                                });
                              }
                            },
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //});
  }
}











