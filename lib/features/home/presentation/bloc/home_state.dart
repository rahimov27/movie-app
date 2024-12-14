import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/home/data/models/search_home_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SearchMoviesLoading extends HomeState {}

class SearchMoviesSuccess extends HomeState {
  final List<SearchHomeModel> movies;
  SearchMoviesSuccess({required this.movies});
}

class SearchMoviesError extends HomeState {
  final String error;
  SearchMoviesError({required this.error});
}

// States for popular movies
class PopularMovieLoading extends HomeState {}

class PopularMovieSuccess extends HomeState {
  final List<PopularMoviesModel> popularMovies;
  PopularMovieSuccess({required this.popularMovies});
}

class PopularMovieError extends HomeState {
  final String error;
  PopularMovieError({required this.error});
}
