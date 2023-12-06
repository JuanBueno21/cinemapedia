
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {

  Future <List<Movie>> getNawPlaying ({ int page = 1 });

  Future <List<Movie>> getPopular ({ int page = 1 });

  Future <List<Movie>> getUpcoming ({ int page = 1 });
  
  Future <List<Movie>> getTorated ({ int page = 1 });

  Future <Movie> getMovieById (String id);

  


}