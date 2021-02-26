import 'package:flutter/cupertino.dart';
import 'package:verossa/Features/News_Letter_Form/Presentation/News_Letter_Form.dart';
import 'package:verossa/Features/Prices/Presentation/Currency_Converter_Widget.dart';

import 'Small_Widgets/Bottom_Image.dart';
import 'Small_Widgets/Follow_Us.dart';
import 'Small_Widgets/More_Info.dart';
import 'Small_Widgets/News_And_Updates_Image.dart';

class BottomSection extends StatefulWidget {
  final ScrollController scrollController;

  BottomSection({this.scrollController});
  @override
  _BottomSectionState createState() => _BottomSectionState(scrollController: scrollController);
}

class _BottomSectionState extends State<BottomSection> {
  final ScrollController scrollController;

  _BottomSectionState({this.scrollController});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MoreInfo(scrollController: scrollController),
      SizedBox(
        height: 20,
      ),
      FollowUs(),
      SizedBox(
        height: 5,
      ),
      NewsAndUpdateImage(),
      SizedBox(
        height: 10,
      ),
      NewsLetterForm(),
      CurrencyConverter(),
      BottomImage()
    ],);
  }
}
