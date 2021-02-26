import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Stock_Limit.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';
import 'package:verossa/Old_Architecture/Controller/Global_Methods.dart';
import 'package:verossa/Old_Architecture/View/Item_Tiles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verossa/Old_Architecture/View/Pre_Check_Out_Page.dart';
import 'package:badges/badges.dart';
import 'dart:math';

//import 'core/network/network_info.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Cart_Badge/Data/Data_Sources/Cart_Badge_Local_Data_Source.dart';
//import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:verossa/Features/Cart_Badge/Data/Repositories/Cart_Badge_Repository_Impl.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Repositories/Cart_Badge_Repository.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Get_Cart_Badge.dart';
//import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';

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
import 'package:verossa/Features/Items/Data/Models/Cart_Model.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
final sl = GetIt.instance;

Future<void> init() async {
//register item models for each item / populate with content

  sl.registerSingleton(ThemeService.getInstance());

  //Providers
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



  // Repository
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

  // Data sources
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
  sl.registerLazySingleton(() => fireBaseFireStore);
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}