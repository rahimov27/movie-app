import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  MovieBloc({required this.repository}) : super(MovieInitial()) {
    // Coming soon bloc
    on<GetComingSoonEvent>((event, emit) async {
      emit(GetComingSoonLoading());
      try {
        final movies = await repository.getComingSoon();
        emit(GetComingSoonSuccess(movieModel: movies));
      } catch (e) {
        emit(GetComingSoonError(error: "$e"));
      }
    });

    // Now playing bloc
    on<GetNowPlayingEvent>((event, emit) async {
      emit(GetNowPlayingLoading());
      try {
        final movies = await repository.nowPlaying();
        emit(GetNowPlayingSuccess(movieModel: movies));
      } catch (e) {
        emit(GetNowPlayingError(error: "$e"));
      }
    });
  }
}
