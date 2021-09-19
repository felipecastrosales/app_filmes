import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final dateFormat = DateFormat('dd/MM/y');
  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 305,
      width: 170,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    movie.posterPath,
                    height: 190,
                    width: 165,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                movie.title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                dateFormat.format(DateTime.parse(movie.releaseDate)),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 65,
            right: -4,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 40,
                child: IconButton(
                  iconSize: 18,
                  icon: Icon(
                    FilmesAppIcons.heartEmpty,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}