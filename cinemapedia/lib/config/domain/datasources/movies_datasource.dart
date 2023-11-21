
import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieDataSource {

  Future <List<Movie>> getNawPlaying({ int page = 1 });

}