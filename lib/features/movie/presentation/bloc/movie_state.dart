part of 'movie_bloc.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class GetComingSoonLoading extends MovieState {}

class GetComingSoonError extends MovieState {
  final String error;
  GetComingSoonError({required this.error});
}

class GetComingSoonSuccess extends MovieState {
  final List<MovieModel> movieModel;
  GetComingSoonSuccess({required this.movieModel});
}

class GetNowPlayingLoading extends MovieState {}

class GetNowPlayingError extends MovieState {
  final String error;
  GetNowPlayingError({required this.error});
}

class GetNowPlayingSuccess extends MovieState {
  final List<MovieModel> movieModel;
  GetNowPlayingSuccess({required this.movieModel});
}

class GetActorsLoading extends MovieState {}

class GetActorsSuccess extends MovieState {
  final List<MovieActorsModel> actors;
  GetActorsSuccess({required this.actors});
}

class GetActorsError extends MovieState {
  final String error;
  GetActorsError({required this.error});
}
