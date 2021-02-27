import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;

class NewPrints extends StatefulWidget {
  final scrollController;
  NewPrints({this.scrollController});
  @override
  _NewPrintsState createState() => _NewPrintsState(scrollController: scrollController);
}

class _NewPrintsState extends State<NewPrints> {
  final scrollController;
  _NewPrintsState({this.scrollController});

  @override
  Widget build(BuildContext context) {
    String priceItem1 = Provider.of<PricesProvider>(context, listen: true).priceItem1;
    String priceItem2 = Provider.of<PricesProvider>(context, listen: true).priceItem2;
    String priceItem3 = Provider.of<PricesProvider>(context, listen: true).priceItem3;
    String priceItem4 = Provider.of<PricesProvider>(context, listen: true).priceItem4;
    String priceItem5 = Provider.of<PricesProvider>(context, listen: true).priceItem5;
    String priceItem6 = Provider.of<PricesProvider>(context, listen: true).priceItem6;
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'NEW PRINTS',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 21),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 18,
                left: 0.0, //20
                bottom: 13,
                right: 10),
            child: GestureDetector(
              onTap: () {

                Navigator.of(context)
                    .pushReplacementNamed('ItemPage1');

                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      child: Image(
                        image:
                        di.sl<ItemFactory>().item1.itemImage,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item1.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 18, left: 10.0, bottom: 13, right: 0),
            child: GestureDetector(
              onTap: () {

                Navigator.of(context)
                    .pushReplacementNamed('ItemPage2');
                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      height: 117,
                      child: Container(
                        child: Image(
                          fit: BoxFit.fill,
                          image: di.sl<ItemFactory>().item2.itemImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item2.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 18, left: 0.0, bottom: 13, right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('ItemPage3');
                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      height: 117,
                      child: Container(
                        child: Image(
                          fit: BoxFit.fill,
                          image:
                          di.sl<ItemFactory>().item3.itemImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item3.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 18, left: 10.0, bottom: 13, right: 0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('ItemPage4');
                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      height: 117,
                      child: Container(
                        height: 80,
                        child: Image(
                          fit: BoxFit.fill,
                          image: di.sl<ItemFactory>().item4.itemImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item4.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem4,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 18, left: 0.0, bottom: 13, right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('ItemPage5');
                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      height: 117,
                      child: Container(
                        child: Image(
                          fit: BoxFit.fill,
                          image: di.sl<ItemFactory>().item5.itemImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item5.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem5,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 18, left: 10.0, bottom: 13, right: 0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('ItemPage6');
                scrollController.jumpTo(0);
              },
              child: Container(
                height: 200,
                width: 175,
                child: Column(
                  children: [
                    Container(
                      height: 117,
                      child: Container(
                        height: 80,
                        child: Image(
                          fit: BoxFit.fill,
                          image: di.sl<ItemFactory>().item6.itemImage,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          height: 30,
                          width: 120,
                          child: Text(
                            di.sl<ItemFactory>().item6.title,
                            style: TextStyle(height: 1.6),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          height: 20,
                          width: 120,
                          child: Text(
                            priceItem6,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],);
  }
}

