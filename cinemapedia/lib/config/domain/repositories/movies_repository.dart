
import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieRepository {

  Future <List<Movie>> getNawPlaying({ int page = 1 });

}