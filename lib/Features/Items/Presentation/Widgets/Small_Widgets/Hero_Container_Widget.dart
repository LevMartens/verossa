import 'package:flutter/cupertino.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';

class HeroContainer extends StatelessWidget {

  final AssetImage assetImage;

  HeroContainer({this.assetImage});




  @override
  Widget build(BuildContext context) {
    return Container(

      height: 425,
      width: 300,
      child: Image(
        image: assetImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
