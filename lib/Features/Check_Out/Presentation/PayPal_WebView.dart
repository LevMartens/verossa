import 'dart:core';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';


import 'Check_Out_Provider.dart';



class PaypalWebView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PaypalWebViewState();
  }
}

class PaypalWebViewState extends State<PaypalWebView> {


  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    String checkoutUrl = Provider.of<CheckOutProvider>(context, listen: false).checkoutUrlPP;

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.of(context).pushReplacementNamed('homePage'),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) async {

            var response = await Provider.of<CheckOutProvider>(context, listen: false).executePayPalPayment(request, context);
            if (response == 'Great Success') { Navigator.of(context).pushReplacementNamed('orderConfirmationPage');}

            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}

