import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';



class AboutUs extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<AboutUs> {
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
            itemExtent: 1650,
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

                        child: Text('ABOUT US', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 210,
                    width: 300,
                    child: Image(image: AssetImage('images/Verossa-Cameraman.jpg')),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Center(child: Text('VEROSSA VALEY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: 300,

                    child: Text(
                    'Verossa Valey is a fictional company, made up to serve as a app development portfolio model. '
                        'The \"prints\" or items in this app are not for sale, the photographs come from copyright free websites and titles were made up on the spot'
                        , textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 2,
                      color: Colors.black87,
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  BottomSection()
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