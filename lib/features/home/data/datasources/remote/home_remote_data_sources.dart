import 'package:dio/dio.dart';
import 'package:movie_app/features/home/data/models/search_home_model.dart';
import 'package:movie_app/shared/app_consts.dart';

abstract class HomeRemoteDataSources {
  Future<List<SearchHomeModel>> findMovie(String title);
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
}
