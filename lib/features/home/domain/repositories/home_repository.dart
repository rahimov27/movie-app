import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/home/data/models/search_home_model.dart';

abstract class HomeRepository {
  Future<List<SearchHomeModel>> findMovie(String title);
  Future<List<PopularMoviesModel>> popularMovies();
}
