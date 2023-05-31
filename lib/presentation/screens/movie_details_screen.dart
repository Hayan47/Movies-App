import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/business_logic/cubit/favorite_cubit.dart';
import 'package:movies_app/constants/my_colors.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_details.dart';
import 'package:movies_app/presentation/widgets/movie_info_list.dart';
import '../../business_logic/cubit/movie_details_cubit.dart';
import '../widgets/movie_info.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie selectedMovie;

  const MovieDetailsScreen({super.key, required this.selectedMovie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetails details = MovieDetails();

  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsCubit>().getMovieDetails(widget.selectedMovie.id!);
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
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoaded) {
          details = (state).movieDetails;
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
                                if (state.contains(widget.selectedMovie)) {
                                  context
                                      .read<FavoriteCubit>()
                                      .removeFromList(widget.selectedMovie);
                                } else {
                                  context
                                      .read<FavoriteCubit>()
                                      .addToList(widget.selectedMovie);
                                }
                              },
                              child: state.contains(widget.selectedMovie)
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Text(
                        '${details.title}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.karla(
                          color: MyColors.myred,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    background: Hero(
                      tag: widget.selectedMovie,
                      child: CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/original'
                            '${details.backdropPath}',
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
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              details.tagline!,
                              style: GoogleFonts.dancingScript(
                                color: MyColors.myFire,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          details.adult!
                              ? Image.asset(
                                  'assets/icons/adult.png',
                                  width: 15,
                                  height: 15,
                                )
                              : Container(),
                          Text(
                            'Overview',
                            style: GoogleFonts.karla(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            details.overview!,
                            style: GoogleFonts.karla(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          buildDevider(),
                          MovieInfoList(
                            title: 'Genre',
                            values: details.genres!,
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Release Date : ',
                            value: details.releaseDate!,
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Run Time : ',
                            value: '${details.runtime.toString()} minutes',
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Rating : ',
                            value: '${details.voteAverage.toString()} \/ 10',
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Votes Count : ',
                            value: details.voteCount.toString(),
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Orginal Language : ',
                            value: details.originalLanguage!,
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Budget : ',
                            value: '${details.budget.toString()} \$',
                          ),
                          buildDevider(),
                          MovieInfo(
                            title: 'Revenue : ',
                            value: '${details.revenue.toString()} \$',
                          ),
                          buildDevider(),
                          MovieInfoList(
                            title: 'Companies',
                            values: details.productionCompanies!,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    details.productionCompanies!.length,
                                    (index) {
                                  return (details.productionCompanies![index]
                                              .logoPath !=
                                          null)
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 1),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey,
                                          ),
                                          height: 25,
                                          child: Center(
                                            child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/original'
                                                    '${details.productionCompanies![index].logoPath}'),
                                          ),
                                        )
                                      : Container();
                                }),
                              ),
                            ),
                          ),
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
                          CachedNetworkImage(
                              imageUrl: 'https://image.tmdb.org/t/p/original'
                                  '${details.posterPath}'),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }
      },
    );
  }
}
