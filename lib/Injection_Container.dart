import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';

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

import 'Features/Currency_Converter/Data/Data_Sources/Currency_Remote_Data_Source.dart';
import 'Features/Currency_Converter/Data/Repositories/Currency_Repository_Impl.dart';
import 'Features/Currency_Converter/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Currency_Converter/Domain/Repositories/Exchange_Rate_Repository.dart';
import 'Features/Currency_Converter/Presentation/Currency_Converter_Provider.dart';
import 'Features/Items/Presentation/Item_Factory.dart';

final sl = GetIt.instance;

Future<void> init() async {
//register item models for each item / populate with content

  sl.registerSingleton(ThemeService.getInstance());

  sl.registerFactory(() => CartBadgeProvider(
      count: sl<GetCartBadgeNumber>(),
      number: sl<SetCartBadgeNumber>(),
      inputConverter: sl(),

    ),
  );
  sl.registerFactory(() => ExchangeRatesProvider(
    rates: sl<GetExchangeRates>(),
    inputConverter: sl(),

  ),
  );

  sl.registerFactory(() => ItemProvider(factory: sl<ItemFactory>()));

  sl.registerLazySingleton(() => ItemFactory());

  // Use cases
  sl.registerLazySingleton(() => GetCartBadgeNumber(sl<CartBadgeRepository>()));
  sl.registerLazySingleton(() => SetCartBadgeNumber(sl<CartBadgeRepository>()));
  sl.registerLazySingleton(() => GetExchangeRates(sl<ExchangeRatesRepository>()));



  // Repository
  sl.registerLazySingleton<CartBadgeRepository>(
        () => CartBadgeRepositoryImpl(
      localDataSource: sl<CartBadgeLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton<ExchangeRatesRepository>(
        () => ExchangeRatesRepositoryImpl(
      remoteDataSource: sl<ExchangeRatesRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ExchangeRatesRemoteDataSource>(
        () => ExchangeRatesRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<CartBadgeLocalDataSource>(
        () => CartBadgeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}