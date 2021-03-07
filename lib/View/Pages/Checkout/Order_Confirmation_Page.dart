import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';

class OrderConfirmation extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<OrderConfirmation> {

   int orderNumber;
  String totalPrice;
  String currentDate;
  String deliveryDate;

   final _scrollController = ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
    orderNumber = new Random().nextInt(1000);
    String now = new DateTime.now().toString();
    var dateParse = DateTime.parse(now);
    currentDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    deliveryDate = "${dateParse.day + 5}-${dateParse.month}-${dateParse.year}";

  }


  @override
  Widget build(BuildContext context) {

    String totalPrice  = Provider.of<PricesProvider>(context, listen: true).totalPriceForCheckOutSummary;
    Map<String,String> userDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    String firstName = userDetails['firstName'];
    String email = userDetails['email'];
    String lastName = userDetails['lastName'];
    String address = userDetails['address'];
    String place = userDetails['place'];
    String country = userDetails['country'];
    Provider.of<CheckOutProvider>(context, listen: false).sendEmail(firstName,email);


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
                    VerossaLogo(),
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
                      child: Text('Your order of $totalPrice at Verossa.co has been confirmed. A confirmation has been sent to you at $email.'),
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
                          Text('$address'),
                          Text('$place'),
                          Text('$country'),
                        ],
                      ),
                    ),
                    Center(
                      child: Image(
                        height: 150,
                        width: 200,
                        image: AssetImage('images/VerossaSmallLogo.jpg'),
                      ),
                    ),
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
                        child: TextButton(
                          onPressed: () async {

                            Navigator.of(context).pushReplacementNamed('/');

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