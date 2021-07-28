import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:senior_project/features/available_times/data/datasources/available_times_remote_data_source.dart';
import 'package:senior_project/features/available_times/data/repositories/available_times_repository_impl.dart';
import 'package:senior_project/features/available_times/domain/repositories/available_times_repository.dart';
import 'package:senior_project/features/available_times/domain/usecases/add_time.dart';
import 'package:senior_project/features/available_times/domain/usecases/delete_time.dart';
import 'package:senior_project/features/available_times/domain/usecases/get_available_times.dart';
import 'package:senior_project/features/available_times/presentation/bloc/available_times_bloc.dart';
import 'package:senior_project/features/camera/data/datasources/camera_remote_data_source.dart';
import 'package:senior_project/features/camera/domain/usecases/banknote_recognition.dart';
import 'package:senior_project/features/camera/domain/usecases/image_captioning.dart';
import 'package:senior_project/features/camera/domain/usecases/text_recognition.dart';
import 'package:senior_project/features/camera/presentation/bloc/camera_bloc.dart';
import 'package:senior_project/features/login/data/datasource/login_local_data_source.dart';
import 'package:senior_project/features/login/data/repository/login_repository_impl.dart';
import 'package:senior_project/features/login/domain/usecase/check_token.dart';
import 'package:senior_project/features/login/domain/usecase/login.dart';
import 'package:senior_project/features/login/domain/validator/login_input_validators.dart';
import 'package:senior_project/features/login/presentation/bloc/login_bloc.dart';
import 'package:senior_project/features/sign_up/data/datasource/sign_up_local_data_source.dart';
import 'package:senior_project/features/sign_up/data/datasource/sign_up_remote_data_source.dart';
import 'package:senior_project/features/sign_up/domain/repository/sign_up_repository.dart';
import 'package:senior_project/features/sign_up/domain/usecase/sign_up.dart';
import 'package:senior_project/features/sign_up/domain/validator/sign_up_input_validators.dart';
import 'package:senior_project/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:senior_project/features/signalr_connection/data/repository/signalr_connection_repository_impl.dart';
import 'package:senior_project/features/signalr_connection/domain/usecase/get_token.dart';
import 'package:senior_project/features/signalr_connection/presentation/bloc/signalr_connection_bloc.dart';
import 'package:senior_project/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:senior_project/features/splash/presentation/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/data/model/base_local_data_source.dart';
import 'core/data/model/base_remote_datasource.dart';
import 'core/data/repository/base_repository.dart';
import 'core/network/network_info.dart';
import 'core/util/constants.dart';
import 'features/camera/data/repositories/camera_repository_impl.dart';
import 'features/camera/domain/repositories/camera_repository.dart';
import 'features/camera/domain/usecases/color_recognition.dart';
import 'features/choose_user/data/data_source/choose_user_local_data_source.dart';
import 'features/choose_user/data/repository/choose_user_repository_impl.dart';
import 'features/choose_user/domain/repository/choose_user_repository.dart';
import 'features/choose_user/domain/usecase/choose_user.dart';
import 'features/choose_user/presentation/bloc/choose_user_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/login/data/datasource/login_remote_data_source.dart';
import 'features/login/domain/repository/login_repository.dart';
import 'features/sign_up/data/repository/sign_up_repository_impl.dart';
import 'features/signalr_connection/domain/repositories/signalr_connection_repository.dart';
import 'features/splash/data/data_source/splash_local_data_source.dart';
import 'features/splash/data/repository/splash_repository_impl.dart';
import 'features/splash/domain/repository/splash_repository.dart';
import 'features/splash/domain/usecase/get_user.dart';
import 'features/volunteer_main/presentation/bloc/volunteer_main_bloc.dart';

final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //! External

  /// Adding the [SharedPreferences] instance to the graph to be later used by the local data sources
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 500000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
      return dio;
    },
  );

  /// Adding the [DataConnectionChecker] instance to the graph to be later used by the [NetworkInfoImpl]
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Core
  ///Creating [NetworkInfoImpl] class
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  /// Instantiating the [BaseRemoteDataSourceImpl]
  sl.registerLazySingleton<BaseRemoteDataSource>(
    () => BaseRemoteDataSourceImpl(dio: sl()),
  );

  /// Instantiating the [BaseLocalDataSourceImpl]
  sl.registerLazySingleton<BaseLocalDataSource>(
    () => BaseLocalDataSourceImpl(sharedPreferences: sl()),
  );

  ///
  ///
  /// Instantiating the [SplashLocalDataSourceImpl]
  sl.registerLazySingleton<SplashLocalDataSource>(
    () => SplashLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<ChooseUserLocalDataSource>(
    () => ChooseUserLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<SignUpLocalDataSource>(
    () => SignUpLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<AvailableTimesRemoteDataSource>(
        () => AvailableTimesRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<CameraRemoteDataSource>(
        () => CameraRemoteDataSourceImpl(dio: sl()),
  );

  // Repository
  /// Instantiating the [BaseRepositoryImpl]
  sl.registerLazySingleton<BaseRepository>(
    () => BaseRepositoryImpl(
      baseRemoteDataSource: sl(),
      networkInfo: sl(),
      baseLocalDataSource: sl(),
    ),
  );

  /// Instantiating the [SplashRepositoryImpl]
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(
      networkInfo: sl(), remoteDataSource: sl(), splashLocalDataSource: sl()));

  sl.registerLazySingleton<ChooseUserRepository>(() => ChooseUserRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
      chooseUserLocalDataSource: sl()));

  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      networkInfo: sl(),
      loginRemoteDataSource: sl(),
      loginLocalDataSource: sl()));

  sl.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(
      networkInfo: sl(),
      signUpLocalDataSource: sl(),
      signUpRemoteDataSource: sl()));

  sl.registerLazySingleton<AvailableTimesRepository>(() => AvailableTimesRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      availableTimesRemoteDataSource: sl()));

  sl.registerLazySingleton<SignalRConnectionRepository>(() => SignalRConnectionRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl()));

  sl.registerLazySingleton<CameraRepository>(() => CameraRepositoryImpl(
      networkInfo: sl(),
      baseLocalDataSource: sl(),
      cameraRemoteDataSource: sl()));

  // ! Use cases
  // Adding the use cases to the injection graph
  sl.registerLazySingleton(() => GetUser(repository: sl()));
  sl.registerLazySingleton(() => ChooseUser(repository: sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => SignUp(repository: sl()));
  sl.registerLazySingleton(() => SignUpInputValidators());
  sl.registerLazySingleton(() => LoginInputValidators());
  sl.registerLazySingleton(() => CheckToken(repository: sl()));
  sl.registerLazySingleton(() => GetAvailableTimes(repository: sl()));
  sl.registerLazySingleton(() => GetToken(repository: sl()));
  sl.registerLazySingleton(() => DeleteTime(repository: sl()));
  sl.registerLazySingleton(() => AddTime(repository: sl()));
  sl.registerLazySingleton(() => ImageCaptioning(repository: sl()));
  sl.registerLazySingleton(() => TextRecognition(repository: sl()));
  sl.registerLazySingleton(() => BanknoteRecognition(repository: sl()));
  sl.registerLazySingleton(() => ColorRecognition(repository: sl()));

  //! Features
  // Bloc
  sl.registerLazySingleton(() => SplashBloc(getUser: sl()));
  sl.registerLazySingleton(() => HomeBloc());
  // sl.registerLazySingleton(
  //         () => AppBloc(getLanguage: sl()));
  sl.registerLazySingleton(() => ChooseUserBloc(chooseUser: sl()));
  sl.registerLazySingleton(
      () => LoginBloc(loginInputValidators: sl(), login: sl(), token: sl()));
  sl.registerLazySingleton(
      () => SignUpBloc(signUpInputValidators: sl(), signUp: sl()));

  sl.registerLazySingleton(
          () => AvailableTimesBloc(sl(), sl(), sl()));

  sl.registerLazySingleton(
          () => VolunteerMainBloc());

  sl.registerLazySingleton(
          () => SignalRConnectionBloc(sl()));

  sl.registerLazySingleton(
          () => CameraBloc(
            sl(),
            sl(),
            sl(),
            sl(),
          ));
}
