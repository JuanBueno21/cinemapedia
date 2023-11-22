


import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDataSource dataSource;
  MovieRepositoryImpl(this.dataSource);


  @override
  Future<List<Movie>> getNawPlaying({int page = 1}) {
    return dataSource.getNawPlaying(page: page);
  }
}