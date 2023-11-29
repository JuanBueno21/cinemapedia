import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreens extends StatelessWidget {

  static const name = "home-screen" ;
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(toRatedMoviesProvider.notifier).loadNextPage();

  }
  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final toRatedMovies = ref.watch(toRatedMoviesProvider);
    

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                // const CustomAppbar(),
          
                MoviesSlideShow(movies: slideShowMovies),
          
                MovieHorizontalListview(movies: nowPlayingMovies,
                title: "En cine",
                subTitle: "2023",
                loadNextPage: () => {ref.read(nowPlayinMoviesProvider.notifier).loadNextPage()
                }),
                
                MovieHorizontalListview(movies: upComingMovies,
                title: "UpComing",
                subTitle: "2024",
                loadNextPage: () => {ref.read(upComingMoviesProvider.notifier).loadNextPage()
                }),
                
                MovieHorizontalListview(movies: popularMovies,
                title: "Populares",
                subTitle: "Ahora",
                loadNextPage: () => {ref.read(popularMoviesProvider.notifier).loadNextPage()
                }),
                
                MovieHorizontalListview(movies: toRatedMovies,
                title: "Top-Rated",
                subTitle: "Ranking",
                loadNextPage: () => {ref.read(toRatedMoviesProvider.notifier).loadNextPage()
                }),

                const SizedBox(height: 10)
          
              ],);
        },
        
        childCount: 1
          
        ))
      ]
    );
  }
}