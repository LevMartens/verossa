import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Util/Cart_Update.dart';
import 'package:verossa/Old_Architecture/View/AppBar+Drawers.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Bottom_Section.dart';
import 'package:verossa/View/Widgets/New_Prints.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Carousel.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Quote.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/Injection_Container.dart' as di;

// TextStyle(
// color: Colors.white60,
// fontWeight: FontWeight.bold)

//getThemeManager(context)
//                                       .toggleDarkLightTheme();

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
    contextForBadgeProv = context;

  }

  @override
  Widget build(BuildContext context) {
    theWidth = MediaQuery.of(context).size.width;
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    checkCartUpdate();

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
      drawer: MyDrawer(
        aScaffoldKey: _scaffoldKey,
      ),
      endDrawer: MyEndDrawer(),
    );
  }

  Future<String> _setupPrices = Future<String>.delayed(
    Duration(seconds: di.sl<CartUpdate>().futureBuilderSec),
        () {
          di.sl<CartUpdate>().futureBuilderSec = 0;
          return 'Data Loaded';
        },
  );

  void checkCartUpdate() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      var cartHasBeenUpdated = di.sl<CartUpdate>().cartUpdated;
      if (cartHasBeenUpdated == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Stock has been updated, your cart has been adjusted',
          textAlign: TextAlign.center,
        )));
        di.sl<CartUpdate>().cartUpdated = false;
      }
    });
  }
}
