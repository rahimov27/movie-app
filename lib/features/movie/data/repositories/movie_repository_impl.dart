import 'package:movie_app/features/home/data/models/popular_movies_model.dart';
import 'package:movie_app/features/movie/data/datasources/movie_remote_data_sources.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSources remoteDataSources;

  MovieRepositoryImpl({required this.remoteDataSources});
  @override
  Future<List<MovieModel>> getComingSoon() async {
    try {
      final result = await remoteDataSources.getComingSoon();
      return result;
    } catch (e) {
      throw Exception("Error in movie repo impl $e");
    }
  }
}
