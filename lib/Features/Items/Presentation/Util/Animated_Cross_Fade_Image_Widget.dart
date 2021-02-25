import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/View/Pages/Item/Item_Detail_Page.dart';
import 'package:verossa/Injection_Container.dart' as di;

import '../Item_Provider.dart';
import 'Hero_Container_Widget.dart';

class AnimatedCrossFadeImage extends StatefulWidget {
  final ItemModel itemModel;

  AnimatedCrossFadeImage({this.itemModel});
  @override
  _AnimatedCrossFadeImageState createState() => _AnimatedCrossFadeImageState(itemModel: itemModel);
}

class _AnimatedCrossFadeImageState extends State<AnimatedCrossFadeImage> {

  HeroContainer a;
  HeroContainer b;
  HeroContainer c;

  ItemModel itemModel;


  _AnimatedCrossFadeImageState({this.itemModel});

  @override
  void initState() {
    super.initState();
    Provider.of<ItemProvider>(context, listen: false).setupProviderForItem(itemModel);
    a = HeroContainer(assetImage: itemModel.itemImage);
    b = HeroContainer(assetImage: itemModel.itemImageBW);
    c = HeroContainer(assetImage: itemModel.itemImageCF);
  }

  @override
  Widget build(BuildContext context) {
    var call = Provider.of<ItemProvider>(context, listen: false);
    var get = Provider.of<ItemProvider>(context, listen: true);

    HeroContainer imageFirst = get.imageFirst;
    HeroContainer imageSecond = get.imageSecond;

    bool startImageOne = get.startImageOne;

    double opacityOne = get.opacityOne;
    double opacityTwo = get.opacityTwo;
    double opacityThree = get.opacityThree;
    double opacityFour = get.opacityFour;
    return  Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 0, top: 30.0),
        child: Center(
          child: Container(

            height: 230,
            width: 360,
            child: GestureDetector(
              onLongPress: () {
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 200),
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                        ItemDetail(itemModel: itemModel,)));
              },
              child: FittedBox(
                fit: BoxFit.fill,
                child: AnimatedCrossFade(
                  firstChild: Hero(tag: 'first', child: imageFirst),
                  secondChild:
                  Hero(tag: 'second', child: imageSecond),
                  duration: Duration(milliseconds: 700),
                  crossFadeState: startImageOne
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 30),
        child: Center(
          child: Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: GestureDetector(
                      onTap: () {
                        call.displayFirstImage(a,b,c);
                      },
                      child: Opacity(
                        opacity: opacityOne,
                        child: Image(
                          image:
                          itemModel.itemImage,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                      onTap: () {
                        call.displaySecondImage(a,b,c);
                      },
                      child: Opacity(
                        opacity: opacityTwo,
                        child: Image(
                          image: itemModel.itemImageBW,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                      onTap: () {
                        call.displayThirdImage(a,b,c);
                      },
                      child: Opacity(
                        opacity: opacityThree,
                        child: Image(
                          image: itemModel.itemImageCF,
                        ),
                      )),
                ),
              ],
            ),
            height: 50,
            width: 300,
          ),
        ),
      ),
    ],);
  }
}
