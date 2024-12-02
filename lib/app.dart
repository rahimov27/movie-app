import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/sign_in_page.dart';
import 'package:movie_app/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignInPage(),
      theme: theme,
    );
  }
}
