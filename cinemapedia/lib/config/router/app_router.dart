
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/home_views/views.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  initialLocation: "/",
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreens(childView: child);
      },
      routes: [

        GoRoute(
          path: "/",
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: "movie/:id",
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters["id"] ?? "no-id";

                return MovieScreen(movieId: movieId);
              },
            )
          ]
        ),


        GoRoute(
          path: "/favorites",
          builder: (context, state) {
            return const FavoritesViews();
          },
        )
      ],
    ),


    //* RUTAS PADRE/HIJO

    // GoRoute(
    //   path: "/",
    //   name: HomeScreens.name,
    //   builder: (context, state) => const HomeScreens(childView: HomeView(),),
    //   routes: [

    //     GoRoute(
    //       path: "movie/:id",
    //       name: MovieScreen.name,
    //       builder: (context, state) {

    //         final movieId = state.pathParameters["id"] ?? "no-id";
    //         return MovieScreen(movieId: movieId);
    //       },
    //     )
    //   ]
    // ),  
  ]
);