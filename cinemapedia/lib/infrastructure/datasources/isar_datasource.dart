

import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';

class IsarDatasource extends LocalStorageDatasource {

  late Future<Isar> db;

  IsarDatasource() {
    db = opendDB();
  }

  Future<Isar> opendDB() async {
    if(Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema], inspector: true, directory: '');
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

    @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovie
    throw UnimplementedError();
  }

}