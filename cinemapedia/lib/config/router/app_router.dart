
import 'package:cinemapedia/presentation/screens/movies/home_screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: "/",
      name: HomeScreens.name,
      builder: (context, state) => const HomeScreens(),
      )

    
  ]);