
import 'package:cinemapedia/config/constants/environtment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';


class ActorMovieDbDatasource extends ActorsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: "https://api.themoviedb.org/3",
    queryParameters: {
      "api_key": Environtment.movieDbKey,
      "language": "es-MEX"
    }
  ));
  

  @override
  Future<List<Actor>> getActorsByMovie(String moviId) async {
    
    final response = await dio.get(
      "/movie/$moviId/credits");

    final castResponde = CreditsResponse.fromJson(response.data);

      List<Actor> actors = castResponde.cast.map((cast) => ActorMapper.castToEntity(cast)
      ).toList() ;

    return actors;
  }
}