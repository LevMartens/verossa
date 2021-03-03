import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Injection_Container.dart' as di;
import '../Item_Model.dart';

class ItemDDTile extends StatelessWidget implements SummaryObject {
  final ItemModel item;
  final String itemFilter;
  final int numberOfItems;
  final String totalPrice;

  ItemDDTile({this.item, this.numberOfItems, this.totalPrice, this.itemFilter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      height: 70,
      width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 7),
        child: Row(
          children: [
            SizedBox(height: 15,),
            Badge(
              animationType: BadgeAnimationType.scale,
              animationDuration:
              Duration(milliseconds: 300),
              borderRadius: BorderRadius.circular(0),
              badgeColor: Colors.grey[700],
              shape: BadgeShape.circle,
              position:
              BadgePosition.topEnd(top: -5, end: -12),
              showBadge: true,
              badgeContent: Text('$numberOfItems' , style: TextStyle(color: Colors.white),),

              child: Container(
                height: 75,
                width: 75,
                child: Image(image:
                itemFilter == 'Normal' ? item.itemImage :
                itemFilter == 'BW' ? item.itemImageBW :
                itemFilter == 'CF' ? item.itemImageCF :
                item.itemImage),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              child: Text(item.title, style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Spacer(),
            Container(
              child: Text(totalPrice, style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            SizedBox(width: 15,)
          ],
        ),
      ),
    );
  }
}
