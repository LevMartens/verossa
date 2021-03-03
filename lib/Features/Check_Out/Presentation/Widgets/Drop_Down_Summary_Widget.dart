import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'Small_Widgets/Summary_Discount_Widget.dart';
import 'Small_Widgets/Summary_Subtotal_Widget.dart';
import 'Small_Widgets/Summary_Total_Widget.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Discount_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Subtotal_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Total_Widget.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';


class DDSummary extends StatefulWidget {

  final List<Widget> summaryDDItems;

  DDSummary({this.summaryDDItems});
  @override
  _InputPageState createState() => _InputPageState(summaryDDItems: summaryDDItems);
}

class _InputPageState extends State<DDSummary> with SingleTickerProviderStateMixin{

  final List<Widget> summaryDDItems;

  _InputPageState({this.summaryDDItems});

  bool orderSummaryIsClosed;
  double containerHeightForSummary;
  String showOrHideSummary;
  AnimationController rotationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rotationController = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
  }


  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        GestureDetector(
          onTap: () {

            if (orderSummaryIsClosed == true) {
              rotationController.forward(from: 0.0);
              orderSummaryIsClosed = false;
              Provider.of<CheckOutProvider>(context, listen: false).extendSliverWith(containerHeightForSummary);
              setState(() {
                showOrHideSummary = 'Hide order summary';
              });
            } else {
              rotationController.reverse();
              orderSummaryIsClosed = true;
              setState(() {
                showOrHideSummary = 'Show order summary';
              });
            }


          },
          child: Container(
            height: 70,
            width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
            decoration: BoxDecoration(
                color: Colors.brown[50],
                border: Border(
                    bottom: BorderSide(
                      color: Colors.brown[100],
                      width: 1,

                    ),
                    top: BorderSide(
                      color: Colors.brown[100],
                      width: 1,

                    )
                )
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(Icons.shopping_cart_outlined),
                SizedBox(width: 10),
                Text(showOrHideSummary,
                  style: TextStyle(fontSize: 17),),
                RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(rotationController),
                    child: Icon(Icons.keyboard_arrow_down)),
                Spacer(),
                Text(subtotalForCheckout,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          crossFadeState: orderSummaryIsClosed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500),
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
          firstChild: Container(),
          secondChild: Container(
            decoration: BoxDecoration(
                color: Colors.brown[50],
                border: Border(
                  bottom: BorderSide(
                    color: Colors.brown[100],
                    width: 1,
                  ),
                )
            ),
            width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
            height: containerHeightForSummary,
            child: Column(
              children: [
                Column(
                  children: summaryDDItems,
                ),
                SummaryDiscount(),
                Divider(
                  indent: 15 ,
                  endIndent: 15,
                  color: Colors.brown[100],
                  thickness: 1,
                ),
                SummarySubtotal(),
                Divider(
                  indent: 15 ,
                  endIndent: 15,
                  color: Colors.brown[100],
                  thickness: 1,
                ),
                SummaryTotal(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
