import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/home/data/models/search_home_model.dart';
import 'package:movie_app/shared/resources/app_consts.dart';

abstract class HomeRemoteDataSources {
  Future<List<SearchHomeModel>> findMovie(String title);
  Future<List<MovieModel>> popularMovies();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final Dio dio;
  HomeRemoteDataSourcesImpl({required this.dio});

  @override
  Future<List<SearchHomeModel>> findMovie(String title) async {
    try {
      final response = await dio.get(
        "https://www.omdbapi.com/?apikey=${AppConsts.omdbApi}&plot=full&s=$title",
      );

      if (response.statusCode == 200 && response.data['Response'] == 'True') {
        final List movies = response.data['Search'];
        return movies.map((movie) => SearchHomeModel.fromJson(movie)).toList();
      } else {
        throw Exception(response.data['Error'] ?? 'Failed to fetch movies');
      }
    } catch (e) {
      throw Exception("Failed to fetch movies: $e");
    }
  }

  @override
  Future<List<MovieModel>> popularMovies() async {
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=${AppConsts.tmdbApi}",
          options: Options(
              headers: {"Authorization": "Bearer ${AppConsts.tmdbAccessApi}"}));
      if (response.statusCode == 200) {
        final List popularMovies = response.data['results'];
        return popularMovies
            .map((popualar) => MovieModel.fromJson(popualar))
            .toList();
      } else {
        throw Exception("Failed to catch popular movies");
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
