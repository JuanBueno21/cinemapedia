
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String> ((ref) => "");

final searchedMoviesProvider = StateNotifierProvider <SearchMoviesNotifier, List<Movie>> ((ref) {

  final moviesRepository = ref.read(movieRepositoryProvider) ;

  return SearchMoviesNotifier(
    searchMovies: moviesRepository.searchMovies, 
    ref: ref);

});

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier <List<Movie>> {

  final SearchMovieCallback searchMovies ;
  final Ref ref;

  

  SearchMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }): super([]);

  Future <List<Movie>> searchMoviesByQuery(String query) async {

    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;

  }

}

