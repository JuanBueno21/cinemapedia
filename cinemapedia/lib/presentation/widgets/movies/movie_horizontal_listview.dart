
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String ? title;
  final String ? subTitle;
  final VoidCallback ? loadNextPage;

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, 
    this.subTitle, 
    this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          if(title != null || subTitle != null)

          _Title(tittle: title, subtitle: subTitle),

        ]),
    );
  }
}

class _Title extends StatelessWidget {

  final String? tittle;
  final String? subtitle;

  const _Title({
    this.tittle, 
    this.subtitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [

          if(tittle != null)
            Text(tittle!, style: titleStyle,),

          const Spacer(),

          if(tittle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: (){},
              child: Text(subtitle ?? "")
              ),
              
        ]),
    );
  }
}