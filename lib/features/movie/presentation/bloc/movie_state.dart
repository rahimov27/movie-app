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
