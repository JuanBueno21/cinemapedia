
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

  // * En cine
  Future <List<Movie>> getNawPlaying({ int page = 1 });

// * Popular
  Future <List<Movie>> getPopular({ int page = 1 });

// * Upcoming
  Future <List<Movie>> getUpcoming({ int page = 1 });

// * Upcoming
  Future <List<Movie>> getTorated({ int page = 1 });
}