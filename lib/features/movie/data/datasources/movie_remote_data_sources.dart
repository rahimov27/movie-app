import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/shared/resources/app_consts.dart';

abstract class MovieRemoteDataSources {
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> nowPlaying();
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
}
