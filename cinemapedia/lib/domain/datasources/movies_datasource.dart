
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {

  Future <List<Movie>> getNawPlaying({ int page = 1 });

}