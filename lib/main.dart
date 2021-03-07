import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/View/Pages/Contact_Us_Page.dart';
import 'package:verossa/View/Pages/Customer_Login_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:verossa/View/Pages/Checkout/Check_Out_Page.dart';
import 'package:verossa/View/Pages/Home/HomePage.dart';
import 'package:verossa/View/Pages/About_Us_Page.dart';
import 'package:verossa/View/Pages/Returns_Policy_Page.dart';
import 'package:verossa/View/Pages/Shipping_Page.dart';
import 'package:verossa/View/Pages/Personal_Page.dart';
import 'package:verossa/View/Pages/Checkout/Order_Confirmation_Page.dart';
import 'package:verossa/View/Pages/Create_Account_Page.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'Core/Util/Did_Finish_Launching_With_Options.dart';
import 'Core/Util/Stateful_Wrapper.dart';
import 'Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'Features/News_Letter_Subscription/Presentation/News_Letter_Provider.dart';
import 'Features/Prices/Presentation/Prices_Provider.dart';
import 'Features/Items/Presentation/Item_Provider.dart';
import 'Features/User/Presentation/User_Provider.dart';
import 'View/Pages/Item/Item_Page.dart';
import 'View/Themes/Dark_Theme.dart';
import 'View/Themes/Light_Theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ThemeManager.initialise();
  await di.init();
  runApp(Webshop());
}

class Webshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          ChangeNotifierProvider<UserProvider>(
              create: (context) => di.sl<UserProvider>()),
          ChangeNotifierProvider<CheckOutProvider>(
              create: (context) => di.sl<CheckOutProvider>()),
        ],
        child: Consumer4<PricesProvider, ItemProvider, UserProvider, CheckOutProvider>(
            builder: (context, pricesPV, itemPV, userPV, checkPV, child) =>
                ThemeBuilder(
                  defaultThemeMode: ThemeMode.light,
                  darkTheme: ThemeData(),
                  lightTheme: ThemeData(),
                  builder: (context, lightTheme, darkTheme, themeMode) {
                    return StatefulWrapper(
                      onInit: () async {
                        await di.sl<DidFinishLaunchingWithOptions>().startUp(context);
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
                          'ContactUs': (_) => ContactUs(),
                          'AboutUs': (_) => AboutUs(),
                          'ReturnsPolicy': (_) => ReturnsPolicy(),
                          'Shipping': (_) => Shipping(),
                          'personalPage': (_) => PersonalPage(),
                          'preCheckout': (_) => CheckOutPage(),
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
