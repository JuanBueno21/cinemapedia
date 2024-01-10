import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
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

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayinMoviesProvider);
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