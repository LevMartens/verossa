import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class ProgressIndi extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<ProgressIndi>
{


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: p(),
        ),
      ),
    );
  }

  Widget p() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    );
  }

}