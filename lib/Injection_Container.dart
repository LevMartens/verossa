import 'package:async/async.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/Order_Remote_Data_Source.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/PayPal_API.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Create_PayPal_Payment.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Get_Access_Token.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Save_Order_To_FireStore.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/SendGrid_Email_Sender.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Stripe_Payment_Processor.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Stock_Limit.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Cart_Badge/Data/Data_Sources/Cart_Badge_Local_Data_Source.dart';
import 'package:verossa/Features/Cart_Badge/Data/Repositories/Cart_Badge_Repository_Impl.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Repositories/Cart_Badge_Repository.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/User_Auth/Domain/Use_Cases/Set_Current_User_Details.dart';
import 'Features/Check_Out/Data/Data_Sources/SendGrid_API.dart';
import 'Features/Check_Out/Data/Data_Sources/Stripe_API.dart';
import 'Features/Check_Out/Data/Repositories/Order_Repository_Impl.dart';
import 'Features/Check_Out/Data/Repositories/PayPal_Repository_Impl.dart';
import 'Features/Check_Out/Data/Repositories/SendGrid_Repository_Impl.dart';
import 'Features/Check_Out/Data/Repositories/Stripe_Repository_Impl.dart';
import 'Features/Check_Out/Domain/Repositories/Order_Repository.dart';
import 'Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'Features/Check_Out/Domain/Repositories/SendGrid_Repository.dart';
import 'Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'Features/Check_Out/Domain/Use_Cases/Finalise_PayPal_Payment.dart';
import 'Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'Features/Items/Data/Data_Sources/Stock_Limit_Remote_Data_Source.dart';
import 'Features/Items/Data/Repositories/Cart_Repository_Impl.dart';
import 'Features/Items/Data/Repositories/Stock_Limit_Repository_Impl.dart';
import 'Features/Items/Domain/Repositories/Cart_Repository.dart';
import 'Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';
import 'Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'Features/Items/Domain/Use_Cases/Get_Stock_Limit.dart';
import 'Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'Features/News_Letter_Form/Data/Data_Sources/News_Letter_Remote_Data_Source.dart';
import 'Features/News_Letter_Form/Data/Repositories/News_Letter_Repository_Impl.dart';
import 'Features/News_Letter_Form/Domain/Repositories/News_Letter_Repository.dart';
import 'Features/News_Letter_Form/Presentation/News_Letter_Provider.dart';
import 'Features/Prices/Data/Data_Sources/Currency_Remote_Data_Source.dart';
import 'Features/Prices/Data/Repositories/Currency_Repository_Impl.dart';
import 'Features/Prices/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Prices/Domain/Repositories/Exchange_Rate_Repository.dart';
import 'Features/Prices/Presentation/Prices_Provider.dart';
import 'Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'package:verossa/Features/Items/Data/Repositories/Cart_Repository_Impl.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http_auth/http_auth.dart';
import 'Features/User_Auth/Data/Data_Sources/Current_User_Remote_Data_Source.dart';
import 'Features/User_Auth/Data/Repositories/Current_User_Repository_Impl.dart';
import 'Features/User_Auth/Domain/Repositories/Current_User_Repository.dart';
import 'Features/User_Auth/Domain/Use_Cases/Get_Current_User_Details.dart';
import 'Features/User_Auth/Domain/Use_Cases/Get_User.dart';
import 'Features/User_Auth/Presentation/User_Provider.dart';

final sl = GetIt.instance;

Future<void> init() async {


  sl.registerLazySingleton<AsyncMemoizer>(
        () => AsyncMemoizer()
  );

  sl.registerSingleton(DidFinishLaunchingWithOptions());

  sl.registerSingleton(ThemeService.getInstance());

  //Providers
  sl.registerFactory(() => CheckOutProvider(
    stripePaymentProcessor: sl<StripePaymentProcessor>(),
    finalisePayPalPayment: sl<FinalisePayPalPayment>(),
    createPayPalPayment: sl<CreatePayPalPayment>(),
    sendGridEmailSender: sl<SendGridEmailSender>(),
    saveOrderToFireStore: sl<SaveOrderToFireStore>(),
    remoteConfig: sl<RemoteConfig>(),
    getAccessToken: sl<GetAccessToken>(),
    inputConverter: sl(),
    factory: sl<ItemFactory>(),
  ),
  );

  sl.registerFactory(() => UserProvider(
    getCurrentUserDetails: sl<GetCurrentUserDetails>(),
    setCurrentUserDetails: sl<SetCurrentUserDetails>(),
    getUser: sl<GetUser>(),
    inputConverter: sl(),
    auth: sl(),
  ),
  );

  sl.registerFactory(() => CartBadgeProvider(
      count: sl<GetCartBadgeNumber>(),
      number: sl<SetCartBadgeNumber>(),
      inputConverter: sl(),

    ),
  );
  sl.registerFactory(() => PricesProvider(
    rates: sl<GetExchangeRates>(),
    inputConverter: sl(),
    itemFactory: sl<ItemFactory>()
  ),
  );

  sl.registerFactory(() => ItemProvider(
      factory: sl<ItemFactory>(),
      inputConverter: sl<InputConverter>(),
      setItemsToCart: sl<SetItemsToCart>(),
      getItemsFromCart: sl<GetItemsFromCart>(),
      setStockLimit: sl<SetStockLimit>(),
      getStockLimit: sl<GetStockLimit>(),
  )
  );

  sl.registerFactory(() => NewsLetterProvider(

    inputConverter: sl<InputConverter>(),
    setEmailToMailingList: sl<SetEmailToMailingList>(),

  )
  );

  sl.registerLazySingleton(() => ItemFactory());

  // Use cases
  sl.registerLazySingleton(() => GetStockLimit(sl<StockLimitRepository>()));
  sl.registerLazySingleton(() => SetStockLimit(sl<StockLimitRepository>()));
  sl.registerLazySingleton(() => GetCartBadgeNumber(sl<CartBadgeRepository>()));
  sl.registerLazySingleton(() => SetCartBadgeNumber(sl<CartBadgeRepository>()));
  sl.registerLazySingleton(() => GetItemsFromCart(sl<CartRepository>()));
  sl.registerLazySingleton(() => SetItemsToCart(sl<CartRepository>()));
  sl.registerLazySingleton(() => GetExchangeRates(sl<ExchangeRatesRepository>()));
  sl.registerLazySingleton(() => SetEmailToMailingList(sl<NewsLetterRepository>()));
  sl.registerLazySingleton(() => SetCurrentUserDetails(sl<CurrentUserRepository>()));
  sl.registerLazySingleton(() => GetCurrentUserDetails(sl<CurrentUserRepository>()));
  sl.registerLazySingleton(() => GetUser(sl<CurrentUserRepository>()));
  sl.registerLazySingleton(() => StripePaymentProcessor(sl<StripeRepository>()));
  sl.registerLazySingleton(() => SaveOrderToFireStore(sl<OrderRepository>()));
  sl.registerLazySingleton(() => GetAccessToken(sl<PayPalRepository>()));
  sl.registerLazySingleton(() => CreatePayPalPayment(sl<PayPalRepository>()));
  sl.registerLazySingleton(() => FinalisePayPalPayment(sl<PayPalRepository>()));
  sl.registerLazySingleton(() => SendGridEmailSender(sl<SendGridRepository>()));

  // Repository
  sl.registerLazySingleton<OrderRepository>(
        () => OrderRepositoryImpl(
      remoteDataSource: sl<OrderRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<PayPalRepository>(
        () => PayPalRepositoryImpl(
      paypalAPI: sl<PayPalAPI>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<StripeRepository>(
        () => StripeRepositoryImpl(
      stripeAPI: sl<StripeAPI>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<CartBadgeRepository>(
        () => CartBadgeRepositoryImpl(
      localDataSource: sl<CartBadgeLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(
      localDataSource: sl<CartLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<ExchangeRatesRepository>(
        () => ExchangeRatesRepositoryImpl(
      remoteDataSource: sl<ExchangeRatesRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<StockLimitRepository>(
        () => StockLimitRepositoryImpl(
      remoteDataSource: sl<StockLimitRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<NewsLetterRepository>(
        () => NewsLetterRepositoryImpl(
      remoteDataSource: sl<NewsLetterRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<CurrentUserRepository>(
        () => CurrentUserRepositoryImpl(
      remoteDataSource: sl<CurrentUserRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<SendGridRepository>(
        () => SendGridRepositoryImpl(
          sendGridAPI: sl<SendGridAPI>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<SendGridAPI>(
        () => SendGridAPIImpl(client: sl(), remoteConfig: sl()),
  );
  sl.registerLazySingleton<PayPalAPI>(
        () => PayPalAPIImpl(basicAuthClient: sl(), client: sl()),
  );
  sl.registerLazySingleton<OrderRemoteDataSource>(
        () => OrderRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<StripeAPI>(
        () => StripeAPIImpl(client: sl(), remoteConfig: sl()),
  );
  sl.registerLazySingleton<CurrentUserRemoteDataSource>(
        () => CurrentUserRemoteDataSourceImpl(firestore: sl(), auth: sl()),
  );

  sl.registerLazySingleton<ExchangeRatesRemoteDataSource>(
        () => ExchangeRatesRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<NewsLetterRemoteDataSource>(
        () => NewsLetterRemoteDataSourceImpl(firestore: sl()),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
        () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<StockLimitRemoteDataSource>(
        () => StockLimitRemoteDataSourceImpl(firestore: sl()),
  );

  sl.registerLazySingleton<CartBadgeLocalDataSource>(
        () => CartBadgeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  final fireBaseFireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  final BasicAuthClient basicAuthClient = BasicAuthClient(remoteConfig.getString('PayPal_Client_ID'), remoteConfig.getString('PayPal_Secret_Key'));

  sl.registerLazySingleton(() => basicAuthClient);
  sl.registerLazySingleton(() => remoteConfig);
  sl.registerLazySingleton(() => fireBaseFireStore);
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());


}

