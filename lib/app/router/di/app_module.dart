import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/router/app_router.dart';

class AppModule extends Module {
  
  @override
  void routes(RouteManager r) {
    r.child(
      AppRouter.movies,
      child: (context) =>  Container(),
    );
  }
}