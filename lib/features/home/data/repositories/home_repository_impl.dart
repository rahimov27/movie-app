import 'package:movie_app/features/home/data/datasources/remote/home_remote_data_sources.dart';
import 'package:movie_app/features/home/data/models/search_home_model.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSources remoteDataSources;
  HomeRepositoryImpl({required this.remoteDataSources});
  @override
  Future<List<SearchHomeModel>> findMovie(String title) async {
    try {
      final result = await remoteDataSources.findMovie(title);
      return result;
    } catch (e) {
      throw Exception("Error in repository impl");
    }
  }
}
