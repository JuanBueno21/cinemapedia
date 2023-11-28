
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
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

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slidee(/*movie:*/ movies[index]) ;
              
            },) )

        ]),
    );
  }
}

class _Slidee extends StatelessWidget {
  
  final Movie movie;
  const _Slidee(this.movie);

  @override
  Widget build(BuildContext context) {

    final textStyle =  Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //*imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  
                  if(loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }

                  return FadeIn(child: child);

                },
              ),
            ),
          ),

          const SizedBox(height: 5),
          

          //*title
          SizedBox(width: 150,
          child: Text(
            movie.title,
            maxLines: 2,
            style: textStyle.titleSmall,
          ),
          ),
          
          //* Rating
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 4),
                Text("${ movie.voteAverage }", style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10),
                // const Spacer(),
                Text(HumanFormats.number(movie.popularity), style: textStyle.bodySmall),
          
              ],
            ),
          )]
      ),
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
      padding: const EdgeInsets.only(top: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [

          if(tittle != null)
            Text(tittle!, style: titleStyle,),

          const Spacer(),

          if(tittle != null)
            FilledButton.tonal(
              // icon: Icon(Icons.date_range_outlined),
              // label: Text("hola"),
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: (){},
              child: Text(subtitle!)
              ),
              
        ]),
    );
  }
}