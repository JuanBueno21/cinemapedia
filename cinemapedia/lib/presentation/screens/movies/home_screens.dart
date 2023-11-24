import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreens extends StatelessWidget {

  static const name = "home-screen" ;
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    
    ref.read(nowPlayinMoviesProvider.notifier).loadNextPage();

  }
  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);
    // if (nowPlayingMovies.length == 0) return CircularProgressIndicator();

    return Column(
      children: [

        const CustomAppbar(),

        MoviesSlideShow(movies: nowPlayingMovies)
      ],
    );
  }
}