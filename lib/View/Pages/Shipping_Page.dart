import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';

class Shipping extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<Shipping> {
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
            itemExtent: 1750,
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

                        child: Text('SHIPPING', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 10,),
                  Container(
                    height: 600,
                    width: 300,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris gravida euismod felis, vel ornare purus ultricies eu. Duis vel sagittis ligula. Sed odio est, commodo vel felis eu, sodales bibendum felis. Duis sit amet arcu sed tortor volutpat porta nec non elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi tempor, diam quis ultrices vehicula, turpis orci eleifend orci, ut aliquet neque ipsum vel erat. Curabitur vulputate diam sed quam tempus lacinia. Nulla facilisi. Quisque consequat euismod eros quis ultrices. Integer aliquet neque a nunc rutrum ullamcorper. Pellentesque in imperdiet justo. Praesent diam tellus, molestie et enim a, pharetra malesuada quam. Maecenas tincidunt, ipsum in pulvinar venenatis, ex elit faucibus ligula, lobortis vulputate ipsum lacus ut nisl.'
                          'Nam elit mi, cursus nec elit in, laoreet aliquet erat. Sed ipsum leo, mattis ut risus et, pharetra eleifend nisl. Nam semper semper vehicula. In efficitur varius dui, id accumsan elit tempor ac. Integer luctus lacinia erat et pretium. Integer sed metus a enim iaculis pretium. Mauris ornare fermentum convallis. In hendrerit blandit tincidunt. Vestibulum tincidunt purus at scelerisque dictum. Morbi finibus congue nibh quis mollis.'
                          'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut eget nunc vestibulum, malesuada arcu et, posuere metus. Aenean eget turpis quis purus euismod ultricies at a velit. Nullam egestas lectus neque, et suscipit est ultricies sit amet. Nunc ac nibh pharetra, gravida dui eget, scelerisque metus. In mollis nisi sit amet tellus convallis dapibus. Fusce non egestas magna. Suspendisse iaculis suscipit velit. Duis ornare orci ex, vitae pulvinar diam viverra et. Donec rhoncus posuere lorem in semper. Nam est turpis, tempus non dapibus vitae, sodales ac leo.'
                      , textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
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