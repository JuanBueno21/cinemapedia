
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: "/",
      name: HomeScreens.name,
      builder: (context, state) => const HomeScreens(),
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
  ]
);