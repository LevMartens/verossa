import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/Features/User_Auth/Presentation/Personal_Page_Details.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/Features/User_Auth/Presentation/Personal_Page_Form.dart';

class PersonalPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<PersonalPage> {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool currentlyOnChangeDetails = false;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;

    Map<String,String> currentUserDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    String  _fullName = currentUserDetails['fullName'];
    String _email = currentUserDetails['email'];
    currentlyOnChangeDetails = Provider.of<UserProvider>(context, listen: true).currentlyOnChangeDetails;


    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2060,
            delegate: SliverChildListDelegate([

              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll),
                  FreeShippingBanner(),
                  SizedBox(height: 20,),
                  VerossaLogo(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text('ACCOUNT DETAILS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text(_fullName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  Divider(
                    indent: 58 ,
                    endIndent: 58,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: 300,

                    child: Text(
                      '$_email'
                      , textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1,
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  currentlyOnChangeDetails == false ? PersonalPageDetails() : PersonalPageForm(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text('ORDER HISTORY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  Divider(
                    indent: 58 ,
                    endIndent: 58,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 300,

                    child: Text(
                      'You haven\'t placed any orders yet'
                      , textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
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