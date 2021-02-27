import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Old_Architecture/View/ContactUs_Page.dart';
import 'package:verossa/Old_Architecture/View/Customer_Login_Screen.dart';
import 'package:verossa/Old_Architecture/View/Item_Screens.dart';
import 'package:verossa/Old_Architecture/Controller/Drawer_Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:verossa/Old_Architecture/View/Pre_Check_Out_Page.dart';
import 'package:verossa/View/Pages/Home/HomePage.dart';
import 'package:verossa/Old_Architecture/Controller/Global_Methods.dart';
import 'package:verossa/Old_Architecture/View/AboutUs_Page.dart';
import 'package:verossa/Old_Architecture/View/ReturnsPolicy_Page.dart';
import 'package:verossa/Old_Architecture/View/Shipping_Page.dart';
import 'package:verossa/Old_Architecture/View/Personal_Page.dart';
import 'package:verossa/Old_Architecture/View/Thank_You_For_Order_Page.dart';
import 'package:verossa/Old_Architecture/View/Create_Account_Screen.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';

import 'Core/Util/Stateful_Wrapper.dart';
import 'Features/News_Letter_Form/Presentation/News_Letter_Provider.dart';
import 'Features/Prices/Presentation/Prices_Provider.dart';
import 'Features/Items/Presentation/Item_Provider.dart';
import 'View/Pages/Item/Item_Page.dart';
import 'View/Themes/Dark_Theme.dart';
import 'View/Themes/Light_Theme.dart';

///item stock regulation

///*no priority* TODO: on personal page where it says no order yet should be an actual overview of past orders.
///*no priority* TODO: put each individual item in paypalPayment.
///*no priority* TODO: now the order gets saved in firebase, a store owner can choose to buy an extra app that keep track of the orders and sends push notifications when an order is made.
///*no priority* TODO: when user is logged in but didn't save his shipping details the height of the slivers needs to have a height adjustment
///*no priority* TODO: for names used in the app use ItemTitles[itemID] instead of writing out name.
///*no priority* TODO: when a user creates an account and fills in the name and adds a space after the name, this should be prevented as it fucks with other things.
///*no priority* TODO: some of the navigations are a bit flicky this might be because the contact page, about us etc on the bottom have a navigation duration

// TODO: share button needs to share portfolio website.

var cartBadge = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  await ThemeManager.initialise();
  runApp(Webshop());
}

class Webshop extends StatelessWidget {

  ///test
  final Map<int,int> map = {
    1: 0,
    2: 3,
    3: 0,
    4: 0,
    5: 4,
    6: 0,
    7: 0,
    8: 2,
    9: 0,
    10: 0,
    11: 0,
    12: 0,
    13: 0,
    14: 0,
    15: 0,
    16: 0,
    17: 0,
    18: 0,
  };
  ///----


  Future<dynamic> _startUp(BuildContext context) async {



    return await di.sl<AsyncMemoizer>().runOnce(() async {

      int cartBadgeCount =
          Provider.of<CartBadgeProvider>(context, listen: true).cartBadgeCount;
      cartBadge = cartBadgeCount;


      ///test
      await Provider.of<ItemProvider>(context, listen: false)
          .setCartContents(map);
      ///----
      await Provider.of<ItemProvider>(context, listen: false)
          .getCartContents();
      await Provider.of<PricesProvider>(context, listen: false)
          .setCurrencyTo(context, 0);
      await Provider.of<ItemProvider>(context, listen: false)
          .getStockLimitFromFS();

      return await Provider.of<ItemProvider>(context, listen: false)
          .updateCartAfterStartUp() ;
    });


  }



  @override
  Widget build(BuildContext context) {


    setUpAfterStartup(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ItemProvider>(
              create: (context) => di.sl<ItemProvider>()),
          ChangeNotifierProvider<CartBadgeProvider>(
              create: (context) => di.sl<CartBadgeProvider>()),
          ChangeNotifierProvider<PricesProvider>(
              create: (context) => di.sl<PricesProvider>()),
          ChangeNotifierProvider<NewsLetterProvider>(
              create: (context) => di.sl<NewsLetterProvider>()),
          ChangeNotifierProvider<DrawerProvider>(
              create: (context) => DrawerProvider()),
        ],
        child: Consumer3<DrawerProvider, PricesProvider, ItemProvider>(
            builder: (context, exchangeRateProvider, providerMyDC, itemPV, child) =>
                ThemeBuilder(
                  defaultThemeMode: ThemeMode.light,
                  darkTheme: ThemeData(),
                  lightTheme: ThemeData(),
                  builder: (context, lightTheme, darkTheme, themeMode) {

                    return StatefulWrapper(
                      onInit: () async {
                        await _startUp(context);
                        print('startup done');
                      },
                      child: MaterialApp(
                        title: 'Verossa Valey',
                        theme: getLightTheme(),
                        darkTheme: getDarkTheme(),
                        themeMode: themeMode,
                        debugShowCheckedModeBanner: false,
                        home: HomePage(),
                        initialRoute: '/',
                        routes: {
                          'homePage': (_) => HomePage(),
                          'customerLogin': (_) => CustomerLogin(),
                          'createAccount': (_) => CreateAccount(),
                          'item1FromSearch': (_) =>
                              Item1Screen(directory: 'All Prints'),
                          'item1FromHome': (_) =>
                              Item1Screen(directory: 'NEW PRINTS'),
                          'item2FromSearch': (_) =>
                              Item2Screen(directory: 'All Prints'),
                          'item2FromHome': (_) =>
                              Item2Screen(directory: 'NEW PRINTS'),
                          'item3FromSearch': (_) =>
                              Item3Screen(directory: 'All Prints'),
                          'item3FromHome': (_) =>
                              Item3Screen(directory: 'NEW PRINTS'),
                          'item4FromSearch': (_) =>
                              Item4Screen(directory: 'All Prints'),
                          'item4FromHome': (_) =>
                              Item4Screen(directory: 'NEW PRINTS'),
                          'item5FromSearch': (_) =>
                              Item5Screen(directory: 'All Prints'),
                          'item5FromHome': (_) =>
                              Item5Screen(directory: 'NEW PRINTS'),
                          'item6FromSearch': (_) =>
                              Item6Screen(directory: 'All Prints'),
                          'item6FromHome': (_) =>
                              Item6Screen(directory: 'NEW PRINTS'),
                          'ContactUs': (_) => ContactUs(),
                          'AboutUs': (_) => AboutUs(),
                          'ReturnsPolicy': (_) => ReturnsPolicy(),
                          'Shipping': (_) => Shipping(),
                          'personalPage': (_) => PersonalPage(),
                          'preCheckout': (_) => PreCheckOut(),
                          'orderConfirmationPage': (_) => OrderConfirmation(),
                          'ItemPage1': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item1),
                          'ItemPage2': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item2),
                          'ItemPage3': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item3),
                          'ItemPage4': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item4),
                          'ItemPage5': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item5),
                          'ItemPage6': (_) =>
                              ItemPage(itemModel: di.sl<ItemFactory>().item6),
                        },
                      ),
                    );
                  },
                )
        )
    );
  }
}
