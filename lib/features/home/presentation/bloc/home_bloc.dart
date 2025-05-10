import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository; // Use the repository

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<SearchMoviesEvent>(
      (event, emit) async {
        emit(SearchMoviesLoading());
        try {
          final movies =
              await repository.findMovie(event.title); // Use repository
          if (movies.isNotEmpty) {
            emit(SearchMoviesSuccess(movies: movies));
          } else {
            emit(SearchMoviesError(error: 'No movies found'));
          }
        } catch (e) {
          emit(SearchMoviesError(error: e.toString()));
        }
      },
    );

    on<GetPopularMovieEvent>((event, emit) async {
      emit(PopularMovieLoading());
      try {
        final popularMovies =
            await repository.popularMovies(); // Use repository
        if (popularMovies.isNotEmpty) {
          emit(PopularMovieSuccess(popularMovies: popularMovies));
        } else {
          emit(PopularMovieError(error: "No popular movies"));
        }
      } catch (e) {
        emit(PopularMovieError(error: "$e"));
      }
    });
  }
}
