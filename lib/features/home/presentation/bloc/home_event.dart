abstract class HomeEvent {}

class SearchMoviesEvent extends HomeEvent {
  final String title;
  SearchMoviesEvent({required this.title});
}

class GetPopularMovieEvent extends HomeEvent {}
