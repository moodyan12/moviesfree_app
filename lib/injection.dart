import 'package:flutter_application_clean_arch/presentation/presentation.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../../../core/core.dart';

final locator = GetIt.instance;

/// Submission 1108243 Fix
/// Make the init asynchronous
Future<void> init() async {
  // SSL pinning
  var logger = Logger();
  Get.put<Logger>(logger); // Memasukkan logger ke dalam container Get

  final DioClient ioClient = DioClient(
    logger: Get.find<Logger>(), // Memastikan Logger diinject ke DioClient
  );

  // external
  Get.put<DioClient>(ioClient);

  // data source
  Get.put<FilmRemoteDataSource>(FilmRemoteDataSourceImpl(
    dioClient: Get.find(),
  ));

  // repository
  Get.put<FilmRepository>(FilmRepositoryImpl(
    remoteDataSource: Get.find(),
  ));

  //bloc
  locator.registerFactory(() => GetFilmBloc(locator()));
  locator.registerFactory(() => SearchFilmBloc(locator()));

  // repository
  locator.registerLazySingleton<FilmRepository>(
    () => FilmRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<FilmRemoteDataSource>(() => FilmRemoteDataSourceImpl(dioClient: Get.find()));

  // helper

  // network info

  // external
  locator.registerLazySingleton(() => ioClient);
}
