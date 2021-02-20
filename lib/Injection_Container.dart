import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verossa/Features/App_Bar/Domain/Use_Cases/Set_Cart_Badge.dart';

import 'core/network/network_info.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/App_Bar/Data/Data_Sources/Cart_Badge_Local_Data_Source.dart';
//import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:verossa/Features/App_Bar/Data/Repositories/Cart_Badge_Repository_Impl.dart';
import 'package:verossa/Features/App_Bar/Domain/Repositories/Cart_Badge_Repository.dart';
import 'package:verossa/Features/App_Bar/Domain/Use_Cases/Get_Cart_Badge.dart';
//import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:verossa/Features/App_Bar/Presentation/App_Bar_Provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia

// Bloc
  sl.registerFactory(
        () {
          print('Here');
          return AppBarProvider(
      count: sl(),
      number: sl(),
      inputConverter: sl(),

    );
        },
  );

  // Use cases
  sl.registerLazySingleton(() {
    print('or here');
    return GetCartBadgeNumber(sl());
  });
  sl.registerLazySingleton(() => SetCartBadgeNumber(sl()));




  // Repository
  sl.registerLazySingleton<CartBadgeRepository>(
        () => CartBadgeRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  // sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  //       () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  // );

  sl.registerLazySingleton<CartBadgeLocalDataSource>(
        () => CartBadgeLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton(() => NetworkInfoImpl(sl()));


  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}