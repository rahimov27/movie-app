import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/movie/data/models/movie_actors_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> nowPlaying();
  Future<List<MovieActorsModel>> getActors(String movieId);
}
