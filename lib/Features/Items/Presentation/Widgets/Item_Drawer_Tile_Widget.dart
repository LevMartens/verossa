import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import '../Item_Model.dart';
import '../Item_Provider.dart';

class ItemDrawerTile extends StatefulWidget {

  final ItemModel item;
  final String itemFilter;
  ItemDrawerTile({this.item, this.itemFilter});

  @override
  _ItemDrawerTileState createState() => _ItemDrawerTileState(item: item, itemFilter: itemFilter);
}

class _ItemDrawerTileState extends State<ItemDrawerTile> {

  final ItemModel item;
  final String itemFilter;
  int itemID;


  TextEditingController _textController = TextEditingController();

  _ItemDrawerTileState({this.item, this.itemFilter});

  @override
  void initState() {
    super.initState();
    _setItemID();
  }

  @override
  Widget build(BuildContext context) {

    Map<int,int> cartContents = Provider.of<ItemProvider>(context, listen: true).cartContentMap;

    _setItemCountInTextField(cartContents);

    String itemPrice = Provider.of<PricesProvider>(context, listen: false).getItemPriceForTile(item.itemNumber);

    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
      height: 110,
      width: 800,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Container(
              height: 175,
              width: 100,
              child: Image(image:
              itemFilter == 'Normal' ? item.itemImage :
              itemFilter == 'BW' ? item.itemImageBW :
              itemFilter == 'CF' ? item.itemImageCF :
              item.itemImage),
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
                        child: Text(item.title),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5.0),
                    child: Container(
                      child:Text(
                        itemPrice,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
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
                                Provider.of<ItemProvider>(context, listen: false)
                                    .subtractItemInCart(itemID, context);
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
                              onFieldSubmitted: (value) async {
                                 await Provider.of<ItemProvider>(context, listen: false)
                                    .onChanged(itemID, int.parse(value), context);
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
                            onTap: () async {
                              await Provider.of<ItemProvider>(context, listen: false)
                                  .addItemToCart(itemID, 1, context, item, itemFilter);
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

  }

  _setItemCountInTextField(Map<int,int> cart) {
    Map<String,int> cartContents = cart.map((a, b) => MapEntry(a.toString(), b ));
    var normalID = item.itemIDForNormal;
    var bwID = item.itemIDForBW;
    var cfID = item.itemIDForCF;
    switch (itemFilter) {

      case 'Normal':
        setState(() {
          _textController.text = cartContents['$normalID'].toString();
        });

        break;

      case 'BW':
        setState(() {
          _textController.text = cartContents['$bwID'].toString();
        });

        break;

      case 'CF':
        setState(() {
          _textController.text = cartContents['$cfID'].toString();
        });

        break;
    }


  }
  _setItemID() {
    switch (itemFilter) {
      case 'Normal':
        itemID = item.itemIDForNormal;
        break;

      case 'BW':
        itemID = item.itemIDForBW;
        break;

      case 'CF':
        itemID = item.itemIDForCF;
        break;
    }
  }
}