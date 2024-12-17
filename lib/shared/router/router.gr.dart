// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:movie_app/features/auth/presentation/sign_in_page.dart' as _i5;
import 'package:movie_app/features/home/presentation/pages/home_page.dart'
    as _i1;
import 'package:movie_app/features/movie/presentation/pages/movie_detail_page.dart'
    as _i3;
import 'package:movie_app/features/movie/presentation/pages/movie_page.dart'
    as _i4;
import 'package:movie_app/features/ticket/presentation/pages/ticket_page.dart'
    as _i6;
import 'package:movie_app/features/user/presentation/pages/user_page.dart'
    as _i7;
import 'package:movie_app/main_screen.dart' as _i2;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}

/// generated route for
/// [_i3.MovieDetailPage]
class MovieDetailRoute extends _i8.PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    _i9.Key? key,
    String? movieTitle,
    String? movieImage,
    String? movieDate,
    String? voteCount,
    bool? adult,
    String? overview,
    String? voteAverage,
    String? originalLanguage,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            key: key,
            movieTitle: movieTitle,
            movieImage: movieImage,
            movieDate: movieDate,
            voteCount: voteCount,
            adult: adult,
            overview: overview,
            voteAverage: voteAverage,
            originalLanguage: originalLanguage,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>(
          orElse: () => const MovieDetailRouteArgs());
      return _i3.MovieDetailPage(
        key: args.key,
        movieTitle: args.movieTitle,
        movieImage: args.movieImage,
        movieDate: args.movieDate,
        voteCount: args.voteCount,
        adult: args.adult,
        overview: args.overview,
        voteAverage: args.voteAverage,
        originalLanguage: args.originalLanguage,
      );
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    this.key,
    this.movieTitle,
    this.movieImage,
    this.movieDate,
    this.voteCount,
    this.adult,
    this.overview,
    this.voteAverage,
    this.originalLanguage,
  });

  final _i9.Key? key;

  final String? movieTitle;

  final String? movieImage;

  final String? movieDate;

  final String? voteCount;

  final bool? adult;

  final String? overview;

  final String? voteAverage;

  final String? originalLanguage;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{key: $key, movieTitle: $movieTitle, movieImage: $movieImage, movieDate: $movieDate, voteCount: $voteCount, adult: $adult, overview: $overview, voteAverage: $voteAverage, originalLanguage: $originalLanguage}';
  }
}

/// generated route for
/// [_i4.MoviePage]
class MovieRoute extends _i8.PageRouteInfo<void> {
  const MovieRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.MoviePage();
    },
  );
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInPage();
    },
  );
}

/// generated route for
/// [_i6.TicketPage]
class TicketRoute extends _i8.PageRouteInfo<void> {
  const TicketRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TicketRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.TicketPage();
    },
  );
}

/// generated route for
/// [_i7.UserPage]
class UserRoute extends _i8.PageRouteInfo<void> {
  const UserRoute({List<_i8.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.UserPage();
    },
  );
}
