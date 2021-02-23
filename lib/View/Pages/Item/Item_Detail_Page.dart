import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Model/Items.dart';

class ItemDetail extends StatefulWidget {
  final ItemModel itemModel;
  ItemDetail({this.itemModel});

  @override
  _InputPageState createState() => _InputPageState(itemModel: itemModel);
}

class _InputPageState extends State<ItemDetail> {

  ItemModel itemModel;
  _InputPageState({this.itemModel});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: itemModel.itemImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}