import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/logic/favorite_bloc/favorite_bloc.dart';
import 'package:movies_app/logic/movie_details_bloc/movie_details_bloc.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: GestureDetector(
        onTap: () {
          context
              .read<MovieDetailsBloc>()
              .add(GetMovieDetails(movieID: movie.id!));
          context.read<FavoriteBloc>().add(GetFavoriteList());
          Navigator.pushNamed(context, 'moviedetailscreen', arguments: movie);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Hero(
                    tag: movie.id!,
                    child: movie.backdropPath != null
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeholder: (context, url) => Image.asset(
                              'assets/images/movie.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            'assets/images/movie.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Hero(
                  tag: movie.title!,
                  child: Text(
                    '${movie.title}',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
