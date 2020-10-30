import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/View/ContactUs_Page.dart';
import 'package:verossa/View/Customer_Login_Screen.dart';
import 'package:verossa/View/Item_Screens.dart';
import 'package:verossa/Controller/Drawer_Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/HomePage.dart';
import 'Controller/Global_Methods.dart';
import 'View/AboutUs_Page.dart';
import 'View/ReturnsPolicy_Page.dart';
import 'View/Shipping_Page.dart';
import 'View/Personal_Page.dart';

// TODO: for names used in the app use ItemTitles[itemID] instead of writing out name.
// TODO: transform the about us page into a read me that explains all the functions in the app


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
                'personalPage:': (_) => PersonalPage(),
              },
            );
          },
        ));
  }
}
