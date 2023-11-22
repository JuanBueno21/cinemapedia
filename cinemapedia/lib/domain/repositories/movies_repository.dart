
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future <List<Movie>> getNawPlaying({ int page = 1 });

}