import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/features/home/data/datasources/remote/home_remote_data_sources.dart';
import 'package:movie_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomeBloc(
          repository: HomeRepositoryImpl(
              remoteDataSources: HomeRemoteDataSourcesImpl(dio: Dio()))),
      child: MyApp(),
    ),
  );
}
