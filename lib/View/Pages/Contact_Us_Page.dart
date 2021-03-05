import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Old_Architecture/Model/Contact_Us_From.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';


class ContactUs extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<ContactUs> {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1800,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll,),
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

                        child: Text('CONTACT US', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 55,
                    width: 300,

                    child: Text(
                      'Got any questions, comments or feedback?'

                      , textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 300,

                    child: Text(
                      'Send us a pigeon at 148 Canning St, Melbourne and we\'ll generally reply within 2 yottaseconds!'

                      , textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ContactUsForm(),
                  SizedBox(
                    height: 80,
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