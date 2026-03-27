import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/response/response.dart' as response;
import 'package:movie_app/shared/network/dio_network_service.dart';
import 'package:movie_app/shared/util/app_exceptions.dart';

class HomePageView extends StatelessWidget {
  final DioNetworkService dioService = DioNetworkService();

  HomePageView({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Test App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Dio Test')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Test GET request
              final Either<AppException, response.Response> result =
                  await dioService.get('https://jsonplaceholder.typicode.com/todos/1');

              result.fold(
                (exception) => print('Error: ${exception.message}'),
                (res) => print('Success! Response data: ${res.data}'),
              );
            },
            child: const Text('Test Dio Request'),
          ),
        ),
      ),
    );
  }
}
