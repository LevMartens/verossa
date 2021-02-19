import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/View/ContactUs_Page.dart';
import 'package:verossa/View/Customer_Login_Screen.dart';
import 'package:verossa/View/Item_Screens.dart';
import 'package:verossa/Controller/Drawer_Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:verossa/View/Pre_Check_Out_Page.dart';
import 'Pages/Home/UI/HomePage.dart';
import 'Controller/Global_Methods.dart';
import 'View/AboutUs_Page.dart';
import 'View/ReturnsPolicy_Page.dart';
import 'View/Shipping_Page.dart';
import 'View/Personal_Page.dart';
import 'View/Thank_You_For_Order_Page.dart';
import 'View/Create_Account_Screen.dart';

// reimplement scaffoldKey and appbar like homePage.dart and itemScreen2. DONE
// add _scrollController.jumpTo(0) to every navigation. DONE
// valey and cart are spelled wrong. DONE
// free shipping when total hits 150. DONE
// photo's are not changing to colour its just random. DONE
// auto fill form. DONE
// link up order notes.DONE
// end drawer doesn't open on login page. DONE
// express shipping should be in summary when selected. DONE
// pass in the real data into the paypalPayment and stripePayments. DONE
// *1 save the order in firebase. DONE
// when home is pressed in confirm order page do *1 and then remove item out of cart. DONE
// the contact and shipping form needs to be filled in and this needs to be checked when pay button is tapped. DONE
// create account button under contact and shipping form. DONE
// double check that when an other currency is selected the checkoutPage will proceed in AUD. DONE
// Make the checkbox for payment selection black. DONE
// after going through one order cycle, with the second order cycle the shipping and contact forms where buggy. Did not experience buggyness after modifying the forms.
// keyboard doesn't pop up with form / fixed by taking formKey out of build and add static. DONE
///*no priority* TODO: on personal page where it says no order yet should be an actual overview of past orders.
///*no priority* TODO: put each individual item in paypalPayment.
///*no priority* TODO: now the order gets saved in firebase, a store owner can choose to buy an extra app that keep track of the orders and sends push notifications when an order is made.
///*no priority* TODO: when user is logged in but didn't save his shipping details the height of the slivers needs to have a height adjustment
///*no priority* TODO: for names used in the app use ItemTitles[itemID] instead of writing out name.
///*no priority* TODO: when a user creates an account and fills in the name and adds a space after the name, this should be prevented as it fucks with other things.
///*no priority* TODO: some of the navigations are a bit flicky this might be because the contact page, about us etc on the bottom have a navigation duration


// TODO: remove todo list when committing to github
// TODO: figure out how to get everything on github, but before you do see if you can remove unused files like functions etc
// TODO: transform the about us page into a read me that explains all the functions in the app
// TODO: when you perform last code check, look at some flutter code examples on github and firebase etc and see if it compares
// TODO: share button needs to share portfolio website.


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Webshop());
}

class Webshop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     setUpAfterStartup(context);


    return MultiProvider(
        providers: [

          ChangeNotifierProvider<DrawerProvider>(
              create: (context) => DrawerProvider()),

        ],
        child: Consumer<DrawerProvider>(
          builder: (context, providerMyDC, child) {


            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              initialRoute: 'homePage',
              routes: {
                'homePage': (_) => HomePage(),
                'customerLogin': (_) => CustomerLogin(),
                'createAccount': (_) => CreateAccount(),
                'item1FromSearch': (_) => Item1Screen(directory: 'All Prints'),
                'item1FromHome': (_) => Item1Screen(directory: 'NEW PRINTS'),
                'item2FromSearch': (_) => Item2Screen(directory: 'All Prints'),
                'item2FromHome': (_) => Item2Screen(directory: 'NEW PRINTS'),
                'item3FromSearch': (_) => Item3Screen(directory: 'All Prints'),
                'item3FromHome': (_) => Item3Screen(directory: 'NEW PRINTS'),
                'item4FromSearch': (_) => Item4Screen(directory: 'All Prints'),
                'item4FromHome': (_) => Item4Screen(directory: 'NEW PRINTS'),
                'item5FromSearch': (_) => Item5Screen(directory: 'All Prints'),
                'item5FromHome': (_) => Item5Screen(directory: 'NEW PRINTS'),
                'item6FromSearch': (_) => Item6Screen(directory: 'All Prints'),
                'item6FromHome': (_) => Item6Screen(directory: 'NEW PRINTS'),
                'ContactUs': (_) => ContactUs(),
                'AboutUs': (_) => AboutUs(),
                'ReturnsPolicy': (_) => ReturnsPolicy(),
                'Shipping': (_) => Shipping(),
                'personalPage': (_) => PersonalPage(),
                'preCheckout': (_) => PreCheckOut(),
                'orderConfirmationPage': (_) => OrderConfirmation(),
              },
            );
          },
        ));
  }
}
