import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/business_logic/cubit/favorite_cubit.dart';
import 'package:movies_app/business_logic/cubit/movies_cubit.dart';
import 'package:movies_app/constants/my_colors.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie selectedMovie;

  MovieDetailsScreen({super.key, required this.selectedMovie});

  Widget MovieInfo(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.karla(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Text(
          value,
          style: GoogleFonts.karla(
            color: Colors.white,
            fontSize: 16,
          ),
        )),
      ],
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      // text: TextSpan(
      //   children: [
      //     TextSpan(
      //       text: title,
      //       style: const TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      //     ),
      //     TextSpan(
      //       text: value,
      //       style: const TextStyle(color: Colors.white, fontSize: 16),
      //     )
      //   ],
      // ),
    );
  }

  Widget buildDevider() {
    return const Divider(
      color: Colors.grey,
      height: 30,
      thickness: 1,
    );
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String image =
        'https://image.tmdb.org/t/p/original' '${selectedMovie.backdropPath}';
    String poster =
        'https://image.tmdb.org/t/p/original' '${selectedMovie.posterPath}';
    //BlocProvider.of<MoviesCubit>(context).getQuotes(selectedMovie.title!);
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<FavoriteCubit, List<Movie>>(
                  builder: (context, state) {
                    return GestureDetector(
                        onTap: () {
                          if (state.contains(selectedMovie)) {
                            context
                                .read<FavoriteCubit>()
                                .removeFromList(selectedMovie);
                          } else {
                            context
                                .read<FavoriteCubit>()
                                .addToList(selectedMovie);
                          }
                        },
                        child: state.contains(selectedMovie)
                            ? Image.asset(
                                'assets/icons/love2.png',
                                width: 30,
                                height: 30,
                              )
                            : Image.asset(
                                'assets/icons/love.png',
                                width: 30,
                                height: 30,
                              ));
                  },
                ),
              )
            ],
            expandedHeight: 600,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Text(
                  '${selectedMovie.title}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karla(
                    color: MyColors.myGold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              background: Hero(
                tag: selectedMovie,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: GoogleFonts.karla(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      selectedMovie.overview!,
                      style: GoogleFonts.karla(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    buildDevider(),
                    MovieInfo('Release Date : ', selectedMovie.releaseDate!),
                    buildDevider(),
                    MovieInfo(
                        'Rating : ', selectedMovie.voteAverage.toString()),
                    buildDevider(),
                    MovieInfo(
                        'Votes Count : ', selectedMovie.voteCount.toString()),
                    buildDevider(),

                    MovieInfo(
                        'Orginal Language : ', selectedMovie.originalLanguage!),
                    const SizedBox(height: 25),
                    Center(
                      child: Text(
                        'Official Poster',
                        style: GoogleFonts.karla(
                          color: Colors.red,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    CachedNetworkImage(imageUrl: poster),

                    //Todo blocbuilder
                    // BlocBuilder<CharactersCubit, CharactersState>(
                    //   builder: (context, state) {
                    //     if (state is QuotesLoaded) {
                    //       var quotes = state.quotes;
                    //       if (quotes.isNotEmpty) {
                    //         int randomQuoteIndex =
                    //             Random().nextInt(quotes.length - 1);
                    //         return Center(
                    //           child: DefaultTextStyle(
                    //             textAlign: TextAlign.center,
                    //             style: const TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 22,
                    //             ),
                    //             child: Text(quotes[randomQuoteIndex].quote),
                    //           ),
                    //         );
                    //       } else {
                    //         // print('hayan');
                    //         // print(quotes);
                    //         return const Text('no quote');
                    //       }
                    //     } else {
                    //       return showProgressIndicator();
                    //     }
                    //   },
                    // )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
