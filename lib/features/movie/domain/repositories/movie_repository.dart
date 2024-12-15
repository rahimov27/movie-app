import 'package:movie_app/features/home/data/models/popular_movies_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> nowPlaying();
}
