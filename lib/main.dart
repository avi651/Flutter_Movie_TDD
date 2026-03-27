import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app.dart';
import 'package:movie_app/core/app_env.dart';
import 'package:movie_app/core/app_observers.dart';
import 'package:movie_app/dependency_injection/injector.dart';

void main() => runMain();

Future<void> runMain() async {
  AppEnv.setup();
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletons();
  provideDataSources();
  provideRepositories();
  provideUseCases();
  // Setting Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = AppObservers();
  runApp(const MyApp());
}