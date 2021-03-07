import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/New_Prints_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Carousel.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Quote.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/Injection_Container.dart' as di;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //theWidth = MediaQuery.of(context).size.width;
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    checkCartUpdate();
    int cartBadgeCount =
        Provider.of<CartBadgeProvider>(context, listen: true).cartBadgeCount;
    cartBadge = cartBadgeCount;
    di.sl<DidFinishLaunchingWithOptions>().screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(
        aScaffoldKey: _scaffoldKey,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2300,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: startScroll,
                  ),
                  FreeShippingBanner(),
                  SizedBox(
                    height: 20,
                  ),
                  VerossaLogo(),
                  SizedBox(height: 10),
                  CarouselHome(),
                  SizedBox(
                    height: 50,
                  ),
                  Quote(),
                  FutureBuilder<String>(
                  future: _setupPrices,
                   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                    return NewPrints(scrollController: _scrollController); }
                    else { return CircularProgressIndicator();}
                  }),
                  SizedBox(
                    height: 35,
                  ),
                  BottomSection(scrollController: _scrollController),
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

  Future<String> _setupPrices = Future<String>.delayed(
    Duration(seconds: di.sl<DidFinishLaunchingWithOptions>().futureBuilderSec),
        () {
          di.sl<DidFinishLaunchingWithOptions>().futureBuilderSec = 0;
          return 'Data Loaded';
        },
  );

  void checkCartUpdate() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      var cartHasBeenUpdated = di.sl<DidFinishLaunchingWithOptions>().cartUpdated;
      if (cartHasBeenUpdated == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Stock has been updated, your cart has been adjusted',
          textAlign: TextAlign.center,
        )));
        di.sl<DidFinishLaunchingWithOptions>().cartUpdated = false;
      }
    });
  }
}
