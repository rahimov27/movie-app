import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/movie/data/models/movie_actors_model.dart';
import 'package:movie_app/shared/resources/app_consts.dart';

abstract class MovieRemoteDataSources {
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> nowPlaying();
  Future<List<MovieActorsModel>> getActors(String movieId);
}

class MovieRemoteDataSourcesImpl implements MovieRemoteDataSources {
  final Dio dio;
  MovieRemoteDataSourcesImpl({required this.dio});

  // get method for coming soon
  @override
  Future<List<MovieModel>> getComingSoon() async {
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/upcoming?api_key=${AppConsts.tmdbApi}");
      if (response.statusCode == 200) {
        final List soonMovies = response.data['results'];
        return soonMovies.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception(response.data['Error'] ?? 'Failed to fetch movies');
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  @override
  Future<List<MovieModel>> nowPlaying() async {
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=${AppConsts.tmdbApi}");
      if (response.statusCode == 200) {
        final List nowPlaying = response.data['results'];
        return nowPlaying.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception(
            response.data['Error'] ?? 'Failed to fetch now playing movies');
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  @override
  Future<List<MovieActorsModel>> getActors(String movieId) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=${AppConsts.tmdbApi}",
      );

      if (response.statusCode == 200) {
        // Достаем список актёров из ответа
        final List<dynamic> castList = response.data['cast'];

        // Преобразуем список в List<MovieActorsModel>
        return castList
            .map((actor) => MovieActorsModel.fromJson(actor))
            .toList();
      } else {
        // Бросаем исключение с кодом ошибки
        throw Exception("Failed to fetch actors: ${response.statusCode}");
      }
    } catch (e) {
      // Общий catch для исключений
      throw Exception("Failed to fetch actors: $e");
    }
  }
}
