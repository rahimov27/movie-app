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
