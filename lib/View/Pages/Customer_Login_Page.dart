import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/Login_Form_Widget.dart';
import 'package:verossa/Features/User_Auth/Presentation/Password_Reset_Form_Widget.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';

class CustomerLogin extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<CustomerLogin> {
bool currentlyOnResetPassword = false;
final _scrollController = ScrollController(keepScrollOffset: false);
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;

    currentlyOnResetPassword = Provider.of<UserProvider>(context, listen: true).currentlyOnResetPassword;


    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1550,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll,),
                  FreeShippingBanner(),
                  SizedBox(height: 20,),
                  VerossaLogo(),
                  SizedBox(height: 10),
                  currentlyOnResetPassword == false ? LoginForm() : PasswordResetForm(),
                  SizedBox(
                    height: 35,
                  ),
                  BottomSection(),
                ]),
              ),
            ]),
          ),
        ],
      ),
      drawer: LeftDrawer(),
      endDrawer: RightDrawer(),
    );
  }


}