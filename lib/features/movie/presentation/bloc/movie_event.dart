part of 'movie_bloc.dart';

abstract class MovieEvent {}

class GetComingSoonEvent extends MovieEvent {}

class GetNowPlayingEvent extends MovieEvent {}

class GetActorsEvent extends MovieEvent {
  final String movieId;
  GetActorsEvent({required this.movieId});
}
