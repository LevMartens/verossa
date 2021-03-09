import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Drop_Down_Summary_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Payment_Options_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Discount_Field_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/CheckOut_Details_From_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Features/User/Presentation/User_Provider.dart';


class CheckOutPage extends StatefulWidget {
  final List<Widget> summaryDDItems;


  CheckOutPage({this.summaryDDItems}); //

  @override
  _InputPageState createState() =>
      _InputPageState(summaryDDItems: summaryDDItems ); //
}

class _InputPageState extends State<CheckOutPage> with SingleTickerProviderStateMixin {
  List<Widget> summaryDDItems;
  bool contactDetailsAreNull;
  final _scrollController = ScrollController(keepScrollOffset: false);
  


  _InputPageState({this.summaryDDItems }); 
  
  
  @override
  void initState() {
    super.initState();
    Provider.of<CheckOutProvider>(context, listen: false).setupStripe();
  }
  

  @override
  Widget build(BuildContext context) {
    double extendSliver = Provider.of<CheckOutProvider>(context, listen: true).extentSliver;
    Map<String,String> userDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: userDetails['address'] != null ? 1100 + extendSliver : 1700 + extendSliver,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    VerossaLogo(),
                    SizedBox(height: 25),
                    DDSummary(summaryDDItems: summaryDDItems),
                    SizedBox(height: 20),
                    CheckOutDetailsForm(),
                    SizedBox(height: 20),
                    Container(
                      width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Gift card or discount code', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    SizedBox(height: 10),
                    DiscountField(),
                    SizedBox(height: 20),
                    Container(
                        width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Payment', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    Container(
                        width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('All transactions are secure and encrypted', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                        )),
                    SizedBox(height: 20,),
                    PaymentOptions(),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_arrow_left),
                              Text('Return to home')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}


