import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Contact_TextFormFields_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Shipping_Method_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Shipping_TextFormFields_Widget.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;
import '../Check_Out_Provider.dart';

class CheckOutDetailsForm extends StatefulWidget {
  @override
  _CheckOutDetailsFormState createState() => _CheckOutDetailsFormState();
}

class _CheckOutDetailsFormState extends State<CheckOutDetailsForm> {


  @override
  Widget build(BuildContext context) {

    Map<String,String> currentUserDetailsMap = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    double containerHeightWhenUserLoggedInAndFormShowing = Provider.of<CheckOutProvider>(context, listen: true).containerHeightWhenUserLoggedInAndFormShowing;

    return Container(
      height: currentUserDetailsMap['address'] != null ? 200 : currentUserDetailsMap['email'] != null ? containerHeightWhenUserLoggedInAndFormShowing : 800,
      width: di.sl<DidFinishLaunchingWithOptions>().screenWidth -30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border(
              right: BorderSide(
                color: Colors.brown[100],
                width: 1,
              ),
              left: BorderSide(
                color: Colors.brown[100],
                width: 1,
              ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShippingTextFormFields(),
          Divider(
            indent: 15 ,
            endIndent: 15,
            color: Colors.brown[100],
            thickness: 1,
          ),
          ShippingMethods(),
        ],
      ),
    );
  }
}
