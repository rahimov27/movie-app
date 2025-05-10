import 'package:flutter/material.dart';
import 'package:movie_app/shared/router/router.dart';
import 'package:movie_app/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: theme,
    );
  }
}
