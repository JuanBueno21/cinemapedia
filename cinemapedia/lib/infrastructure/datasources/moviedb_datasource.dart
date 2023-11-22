import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';


class Moviedbdatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {
      "api_key": Environtment.movieDbKey,
      "language": "es-MEX"
    }
  )
  );

  @override
  Future<List<Movie>> getNawPlaying({int page = 1}) async {

    final response = await dio.get("/movie/now_playing");
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != "no-poster" )
    .map(
      
      (moviedb) => MovieMapper.moviedbToEntity(moviedb)
      ).toList();

    return movies;
  }
}