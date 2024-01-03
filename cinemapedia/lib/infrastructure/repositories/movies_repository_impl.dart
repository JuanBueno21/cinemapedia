


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
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }
  
  @override
  Future<List<Movie>> getTorated({int page = 1}) {
    return dataSource.getTorated(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) {
    return dataSource.searchMovies(query);
  }
}