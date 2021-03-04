import 'dart:core';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'PaypalServices.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:verossa/Old_Architecture/Controller/PaypalServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:verossa/Old_Architecture/Controller/Global_Methods.dart';
import 'package:provider/provider.dart';



// class PaypalPayment extends StatefulWidget {
//   final Function onFinish;
//   final String itemName;
//   final String itemPrice;
//   final int itemQuantity;
//   final bool standardShipping;
//
//
//
//   PaypalPayment({this.onFinish, this.itemName, this.itemPrice, this.itemQuantity, this.standardShipping});
//
//   @override
//   State<StatefulWidget> createState() {
//     return PaypalPaymentState(itemName: itemName, itemPrice: itemPrice, itemQuantity: itemQuantity, standardShipping: standardShipping);
//   }
// }
//
// class PaypalPaymentState extends State<PaypalPayment> {
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   //String checkoutUrl;
//   String checkoutUrl = "";
//   String executeUrl;
//   String accessToken;
//   PaypalServices services = PaypalServices();
//
//   Map<dynamic,dynamic> defaultCurrency = {"symbol": "AUD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "AUD"};
//
//   bool isEnableShipping = false;
//   bool isEnableAddress = false;
//
//   String returnURL = 'return.example.com';
//   String cancelURL = 'cancel.example.com';
//
//   String itemName;
//   String itemPrice;
//   int itemQuantity;
//   bool standardShipping;
//
//   PaypalPaymentState({this.itemName, this.itemPrice, this.itemQuantity, this.standardShipping});
//
//   @override
//   void initState() {
//     super.initState();
//
//     Future.delayed(Duration.zero, () async {
//       try {
//         accessToken = await services.getAccessToken();
//
//         final transactions = getOrderParams();
//         final res =
//         await services.createPaypalPayment(transactions, accessToken);
//         if (res != null) {
//           setState(() {
//             checkoutUrl = res["approvalUrl"];
//             executeUrl = res["executeUrl"];
//           });
//         }
//       } catch (e) {
//         print('exception: '+e.toString());
//         final snackBar = SnackBar(
//           content: Text(e.toString()),
//           duration: Duration(seconds: 10),
//           action: SnackBarAction(
//             label: 'Close',
//             onPressed: () {
//               // close snackBar
//             },
//           ),
//         );
//         _scaffoldKey.currentState.showSnackBar(snackBar);
//       }
//     });
//   }
//
//   // item name, price and quantity
//   //String itemName = 'iPhone X';
//   //String itemPrice = '1.99';
//   //int quantity = 1;
//
//   Map<String, dynamic> getOrderParams() {
//     List items = [
//       {
//         "name": itemName,
//         "quantity": itemQuantity,
//         "price": itemPrice,
//         "currency": defaultCurrency["currency"]
//       }
//     ];
//
//
//     // checkout invoice details
//     String totalAmount = itemPrice;
//      String subTotalAmount = itemPrice;
//     // String shippingCost = '0';
//     // int shippingDiscountCost = 0;
//     // String userFirstName = 'Gulshan';
//     // String userLastName = 'Yadav';
//     // String addressCity = 'Delhi';
//     // String addressStreet = 'Mathura Road';
//     // String addressZipCode = '110014';
//     // String addressCountry = 'India';
//     // String addressState = 'Delhi';
//     // String addressPhoneNumber = '+919990119091';
//
//     Map<String, dynamic> temp = {
//       "intent": "sale",
//       "payer": {"payment_method": "paypal"},
//       "transactions": [
//         {
//           "amount": {
//             "total": totalAmount,
//             "currency": defaultCurrency["currency"],
//             "details": {
//               "subtotal": subTotalAmount,
//               //"shipping": shippingCost,
//               // "shipping_discount":
//               // ((-1.0) * shippingDiscountCost).toString()
//             }
//           },
//           "description": "Verossa Valey",
//           "payment_options": {
//             "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
//           },
//           "item_list": {
//             "items": items,
//             // if (isEnableShipping &&
//             //     isEnableAddress)
//             //   "shipping_address": {
//             //     "recipient_name": userFirstName +
//             //         " " +
//             //         userLastName,
//             //     "line1": addressStreet,
//             //     "line2": "",
//             //     "city": addressCity,
//             //     "country_code": addressCountry,
//             //     "postal_code": addressZipCode,
//             //     "phone": addressPhoneNumber,
//             //     "state": addressState
//             //   },
//           }
//         }
//       ],
//       "note_to_payer": "Contact us for any questions on your order.",
//       "redirect_urls": {
//         "return_url": returnURL,
//         "cancel_url": cancelURL
//       }
//     };
//     return temp;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     if (checkoutUrl != null) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).backgroundColor,
//           leading: GestureDetector(
//             child: Icon(Icons.arrow_back_ios),
//             onTap: () => Navigator.of(context).pushReplacementNamed('homePage'),
//           ),
//         ),
//         body: WebView(
//           initialUrl: checkoutUrl,
//           javascriptMode: JavascriptMode.unrestricted,
//           navigationDelegate: (NavigationRequest request) {
//
//             if (request.url.contains(returnURL)) {
//
//               final uri = Uri.parse(request.url);
//               final payerID = uri.queryParameters['PayerID'];
//
//               if (payerID != null)  {
//                 services
//                     .executePayment(executeUrl, payerID, accessToken)
//                     .then((id) {
//                   widget.onFinish(id);
//                   print('A');
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) => ShowDialogToDismissPaypal(
//                           title: 'Payment Successful',
//                           content:
//                           'Great political success',
//                           buttonText: 'CLOSE'));
//
//
//
//                   var date = DateTime.now().toString();
//                   firestore.collection("Orders").doc('$orderNumber - $date ').set({
//                     'Name': fullName,
//                     'totalPrice': subtotalForCheckout,
//                     'standardShipping': standardShipping,
//                     'Items': itemListForCheckout,
//                     'email': email,
//                     'orderDate': date,
//                     'Address': '$apartment $street',
//                     'Suburb': place,
//                     'Country': country,
//                     'State': state,
//                     'OrderNote': orderNotes,
//
//
//
//                   });
//                   updateStockAndCartAfterOrderConfirmation();
//
//                   Navigator.of(context).pushReplacementNamed('orderConfirmationPage');
//                 });
//               } else {
//                 print('D');
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) => ShowDialogToDismissPaypal(
//                         title: 'Payment Unsuccessful',
//                         content:
//                         'Something went wrong, please try again',
//                         buttonText: 'CLOSE'));
//
//
//
//               }
//               print('B');
//
//
//             }
//             if (request.url.contains(cancelURL)) {
//               print('C');
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) => ShowDialogToDismissPaypal(
//                       title: 'Payment Unsuccessful',
//                       content:
//                       'Something went wrong, please try again',
//                       buttonText: 'CLOSE'));
//
//
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       );
//     } else {
//       return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//           backgroundColor: Colors.black12,
//           elevation: 0.0,
//         ),
//         body: Center(child: Container(child: CircularProgressIndicator())),
//       );
//     }
//   }
// }
//
// class ShowDialogToDismissPaypal extends StatelessWidget {
//   final String content;
//   final String title;
//   final String buttonText;
//   ShowDialogToDismissPaypal({this.title, this.buttonText, this.content});
//   @override
//   Widget build(BuildContext context) {
//     if (!Platform.isIOS) {
//       return AlertDialog(
//         title: new Text(
//           title,
//         ),
//         content: new Text(
//           this.content,
//         ),
//         actions: <Widget>[
//           new FlatButton(
//             child: new Text(
//               buttonText,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     } else {
//       return CupertinoAlertDialog(
//           title: Text(
//             title,
//           ),
//           content: new Text(
//             this.content,
//           ),
//           actions: <Widget>[
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               child: new Text(
//                 buttonText[0].toUpperCase() +
//                     buttonText.substring(1).toLowerCase(),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).pop();
//               },
//             )
//           ]);
//     }
//   }
// }