import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
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


  List<Movie>_jsonToMovies(Map<String, dynamic> json) {

    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != "no-poster" )
    .map(
      (moviedb) => MovieMapper.moviedbToEntity(moviedb)
      ).toList();

    return movies;
  }


  // npw_playing
  @override
  Future<List<Movie>> getNawPlaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing",
    queryParameters: {
      "page": page
    });
    return _jsonToMovies(response.data);
  }
  

  // popular
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {

    final response = await dio.get("/movie/popular",
    queryParameters: {
      "page": page
    });
    return _jsonToMovies(response.data);
  }
  
  // upcoming
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {

    final response = await dio.get("/movie/upcoming",
    queryParameters: {
      "page": page
    });
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTorated ({int page = 1}) async {
    final response = await dio.get("/movie/top_rated",
    queryParameters: {
      "page": page
    });
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get("/movie/$id");
    if(response.statusCode != 200) throw Exception("Movie with Id: $id not found");

    final moviDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(moviDetails) ;

    return movie;
    }
    
      @override
      Future<List<Movie>> searchMovies(String query) async {

        if (query.isEmpty) return [];

        final response = await dio.get("/search/movie",
          queryParameters: {
            "query": query
    });
    return _jsonToMovies(response.data);
  
      }
  }