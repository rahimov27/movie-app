import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/datasources/remote/home_remote_data_sources.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRemoteDataSources dataSource;

  HomeBloc({required this.dataSource}) : super(HomeInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      emit(SearchMoviesLoading());
      try {
        final movies = await dataSource.findMovie(event.title);
        if (movies.isNotEmpty) {
          emit(SearchMoviesSuccess(movies: movies));
        } else {
          emit(SearchMoviesError(error: 'No movies found'));
        }
      } catch (e) {
        emit(SearchMoviesError(error: e.toString()));
      }
    });
  }
}
