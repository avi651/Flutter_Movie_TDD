
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initSingletons() async {
  // //Services
  // injector.registerLazySingleton<LocalDb>(() => InitDbImpl());
  // injector.registerLazySingleton<NetworkService>(() => DioNetworkService());
  // injector.registerLazySingleton<SharedPref>(() => SharedPrefImplementation());

  // //initiating db
  // await injector<LocalDb>().initDb();
}

void provideDataSources() {
  // //Home
  // injector.registerFactory<HomeLocalDataSource>(
  //     () => HomeLocalDataSourceImpl(localDb: injector.get<LocalDb>()));
  // injector.registerFactory<HomeRemoteDataSource>(() =>
  //     HomeRemoteDataSourceImpl(networkService: injector.get<NetworkService>()));

  // //MovieDetail
  // injector.registerFactory<MovieDetailRemoteDataSource>(() =>
  //     MovieDetailRemoteDataSourceImpl(
  //         networkService: injector.get<NetworkService>()));
  // injector.registerFactory<MovieDetailLocalDataSource>(
  //     () => MovieDetailLocalDataSourceImpl(localDb: injector.get<LocalDb>()));

  // //Bookmark
  // injector.registerFactory<BookmarkLocalDataSource>(
  //     () => BookmarkLocalDataSourceImpl(localDb: injector.get<LocalDb>()));


  // //Notification
  // injector.registerFactory<NotificationsLocalDataSource>(
  //         () => NotificationsLocalDataSourceImpl(localDb: injector.get<LocalDb>()));
}

void provideRepositories() {
  //home
   // injector.registerFactory<HomeRepository>(() => HomeRepositoryImpl(
   //   homeRemoteDataSource: injector.get<HomeRemoteDataSource>(),
   //   homeLocalDataSource: injector.get<HomeLocalDataSource>()));

  //MovieDetail
  //injector.registerFactory<MovieDetailRepository>(() =>
  //    MovieDetailRepositoryImpl(
  //        movieDetailRemoteDataSource: injector.get<MovieDetailRemoteDataSource>(),
  //        movieDetailLocalDataSource:
  //            injector.get<MovieDetailLocalDataSource>()));

  //Bookmark
  //injector.registerFactory<BookmarkRepository>(() => BookmarkRepositoryImpl(
  //    bookmarkLocalDataSource: injector.get<BookmarkLocalDataSource>()));


  //Notification
  //injector.registerFactory<NotificationRepository>(() => NotificationRepositoryImpl(
  //    notificationsLocalDataSource: injector.get<NotificationsLocalDataSource>()));
}

void provideUseCases() {
  //home
  //injector.registerFactory<FetchAndCacheGenreUseCase>(() => FetchAndCacheGenreUseCase(homeRepository: injector.get<HomeRepository>()));
  //injector.registerFactory<FetchAndCacheMoviesUseCase>(() => FetchAndCacheMoviesUseCase(homeRepository: injector.get<HomeRepository>()));
  //injector.registerFactory<FetchCacheGenresUseCase>(() => FetchCacheGenresUseCase(homeRepository: injector.get<HomeRepository>()));
  //injector.registerFactory<FetchCachedMoviesUseCase>(() => FetchCachedMoviesUseCase(homeRepository: injector.get<HomeRepository>()));

  //MovieDetail
  //injector.registerFactory<AddBookmarkUseCase>(() => AddBookmarkUseCase(movieDetailRepository: injector.get<MovieDetailRepository>()));
  //injector.registerFactory<GetCastsUseCase>(() => GetCastsUseCase(movieDetailRepository: injector.get<MovieDetailRepository>()));
  //injector.registerFactory<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(movieDetailRepository: injector.get<MovieDetailRepository>()));
  //injector.registerFactory<IsBookmarkedUseCase>(() => IsBookmarkedUseCase(movieDetailRepository: injector.get<MovieDetailRepository>()));
  //injector.registerFactory<RemoveBookmarkUseCase>(() => RemoveBookmarkUseCase(movieDetailRepository: injector.get<MovieDetailRepository>()));
  //injector.registerFactory(() => GetVideosUseCase(movieDetailRemoteDataSource: injector.get<MovieDetailRemoteDataSource>()));

  //Bookmarks
  //injector.registerFactory<GetBookmarksUseCase>(() => GetBookmarksUseCase(bookmarkRepository: injector.get<BookmarkRepository>()));
  // injector.registerFactory<RemoveBookmarkUseCase>(() => RemoveBookmarkUseCase(bookmarkRepository: injector.get<BookmarkRepository>()));


  //Notifications
  //injector.registerFactory<GetAllNotificationsUseCase>(() => GetAllNotificationsUseCase(notificationRepository: injector.get<NotificationRepository>()));
  //injector.registerFactory<ClearAllNotificationsUseCase>(() => ClearAllNotificationsUseCase(notificationRepository: injector.get<NotificationRepository>()));

}

