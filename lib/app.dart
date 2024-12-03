import 'package:flutter/material.dart';
import 'package:movie_app/shared/router/router.dart';
import 'package:movie_app/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter().delegate(),
      routeInformationParser: AppRouter().defaultRouteParser(),
      theme: theme,
    );
  }
}
