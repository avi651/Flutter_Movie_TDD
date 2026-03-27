import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/home_page.dart';

enum Routes {
  home,
  movieDetail,
  bookmarks,
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePageView(
          key: state.pageKey,
        ),
      ),
      
    ],
  );

  static GoRouter get router => _router;
}