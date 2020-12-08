import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Model/Global_Variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:verossa/Model/Global_Variables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verossa/Controller/PaypalPayment.dart';
import 'dart:math';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';


///NEXT: The email works but gets caught in spamfilters
///When home button is pressed reset cart in global variables and sharedpref, and firebase stock needs to be updated and deduct the items
/// template id:   d-fdf6eefcc4f745daa8a467446f596d3e
/// API KEY: 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
/// 'australia-southeast1'

class OrderConfirmation extends StatefulWidget {
  final List<Container> dropdownMenuItems;

  OrderConfirmation({this.dropdownMenuItems});

  @override
  _InputPageState createState() =>
      _InputPageState(dropdownMenuItems: dropdownMenuItems);
}

class _InputPageState extends State<OrderConfirmation> {
   List<Container> dropdownMenuItems;
   //int orderNumber;
  String totalPrice;
  String currentDate;
  String deliveryDate;
  String emailBody;



  sendEmail() async {

    var body = json.encode({
      'personalizations': [{'to':[{'email':'$email'}], "dynamic_template_data": {
        "subject": "Verossa: Order confirmation ",
        "name":"$firstName",
        "text": "$emailBody"
      }}],
      'from': {"email":"levmartens@gmail.com","name":"Lev Martens"},
      "reply_to":{"email":"levmartens@gmail.com","name":"Lev Martens"},

      "template_id": "d-fdf6eefcc4f745daa8a467446f596d3e"
    });

    try {
      var response = await http.post("https://api.sendgrid.com/v3/mail/send",
          headers: {
          'Authorization': 'Bearer ' + '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', //'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',
           'Content-Type': 'application/json',

          },
        body: body

          );
      print('$response');
    } catch (e) {
      print(e);
      rethrow;
    }

  }


  _InputPageState({this.dropdownMenuItems});

   final _scrollController = ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    // print('random Number: ${randomNumber.nextInt(10000)}');
    // orderNumber = randomNumber.nextInt(10000);
    String now = new DateTime.now().toString();
    var dateParse = DateTime.parse(now);
    currentDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    deliveryDate = "${dateParse.day + 5}-${dateParse.month}-${dateParse.year}";
    print('This is current date: $currentDate');
    emailBody = 'Thank you for your order with order number $orderNumber. In this email, you can read what to expect and the expected delivery date. As soon as your order is on it\'s way, we\'ll send you a notification.';
    sendEmail();
  }

  @override
  void dispose() {
    super.dispose();

  }






  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 900,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                'VERØSSA',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 4,
                                    fontFamily: 'Cormorant',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'VALLEY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 4,
                                    fontFamily: 'Cormorant',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'PHOTOGRAPHY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    letterSpacing: 4,
                                    fontFamily: 'Cormorant',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 45),
                    Center(child: Icon(Icons.check_circle_outline, size: 75, color: Colors.green,)),
                    SizedBox(height: 15),
                    Center(child: Text('Thank you $firstName!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),)),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          Text('Order number:'),
                          SizedBox(width: 5,),
                          Text('#$orderNumber', style: TextStyle(fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Your order of $subtotalForCheckout at Verossa.co has been confirmed. A confirmation has been sent to you at $email.'),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery details', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                          SizedBox(height: 5),
                          Text('Your order will be dispatched on $currentDate.'),
                          SizedBox(height: 5),
                          Text('Your order should be delivered on $deliveryDate.'),
                          SizedBox(height: 25),
                          Text('Address', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                          SizedBox(height: 5),
                          Text('$firstName $lastName'),
                          Text('$street'),
                          Text('$place'),
                          Text('$country'),
                        ],
                      ),
                    ),
                    //SizedBox(height: 50),
                    Center(
                      child: Image(
                        height: 150,
                        width: 200,
                        image: AssetImage('images/VerossaSmallLogo.jpg'),
                      ),
                    ),
                    //SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () async {





                            Navigator.of(context).pushReplacementNamed('homePage');




                          },
                          child: Text(
                            'HOME',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),









                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}