import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quote_app/core/Api/Api_consumer.dart';
import 'package:quote_app/core/Api/App_interceptor.dart';
import 'package:quote_app/core/Api/dio_consumer.dart';
import 'package:quote_app/features/splash_screen/data/repositories/lang_repository_impl.dart';
import 'package:quote_app/features/splash_screen/domain/repositories/lang_repository.dart';
import 'package:quote_app/features/splash_screen/domain/usecases/change_locale.dart';
import 'package:quote_app/features/splash_screen/domain/usecases/get_saved_lang.dart';
import 'package:quote_app/features/splash_screen/presentation/cubit/local_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quote_app/core/network/network_info.dart';
import 'package:quote_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quote_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quote_app/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quote_app/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quote_app/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';

import 'features/splash_screen/data/datasources/lang_local_data_source.dart';

final sl = GetIt.instance;
Future<void> init() async {
//Features
//bloc
  sl.registerFactory(
    () => RandomQuoteCubit(getRandomQuoteUseCase: sl()),
  );

  sl.registerFactory<LocalCubit>(
    () => LocalCubit(
      getSavedLangUseCase: sl(),
      changeLangUseCase: sl(),
    ),
  );

//use Cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));

//Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        localDataSource: sl(),
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));

  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(
        langLocalDataSource: sl(),
      ));
//Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(sharedPreferences: sl()),
  );

//Cores
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        connectionChecker: sl(),
      ));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

//External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  sl.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      requestBody: true,
      error: true,
    ),
  );
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );
}
