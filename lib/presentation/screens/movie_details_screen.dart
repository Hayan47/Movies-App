import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/logic/favorite_bloc/favorite_bloc.dart';
import 'package:movies_app/logic/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/presentation/widgets/movie_info_list.dart';
import 'package:movies_app/presentation/widgets/shimmer_movie_details.dart';
import '../widgets/movie_info_row.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetailsScreen({super.key, required this.selectedMovie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoaded) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                          if (state is FavoriteUpdated) {
                            return GestureDetector(
                                onTap: () {
                                  if (state.favorites.contains(selectedMovie)) {
                                    context.read<FavoriteBloc>().add(
                                        RemoveFromFavorite(
                                            movie: selectedMovie));
                                  } else {
                                    context.read<FavoriteBloc>().add(
                                        AddToFavorite(movie: selectedMovie));
                                  }
                                },
                                child: state.favorites.contains(selectedMovie)
                                    ? Image.asset(
                                        'assets/icons/love2.png',
                                        width: 30,
                                        height: 30,
                                      )
                                    : Image.asset(
                                        'assets/icons/love.png',
                                        width: 30,
                                        height: 30,
                                        color: Colors.white,
                                      ));
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  ],
                  expandedHeight: MediaQuery.sizeOf(context).height * 0.7,
                  pinned: true,
                  stretch: true,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(bottom: 10),
                    centerTitle: true,
                    title: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Text(
                        '${state.movie.title}',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.nunito(
                          color: MyColors.myred,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    background: Hero(
                      tag: state.movie.id!,
                      child: CachedNetworkImage(
                        imageUrl: 'https://image.tmdb.org/t/p/original'
                            '${state.movie.backdropPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  iconTheme: const IconThemeData(color: Colors.white),
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
                              state.movie.tagline!,
                              style: GoogleFonts.dancingScript(
                                color: MyColors.myFire,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          state.movie.adult!
                              ? Image.asset(
                                  'assets/icons/adult.png',
                                  width: 15,
                                  height: 15,
                                )
                              : Container(),
                          Text(
                            'Overview',
                            style: GoogleFonts.nunito(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            state.movie.overview!,
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfoList(
                            title: 'Genre',
                            values: state.movie.genres!,
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Release Date : ',
                            value: state.movie.releaseDate!,
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Run Time : ',
                            value: '${state.movie.runtime.toString()} minutes',
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Rating : ',
                            value:
                                '${state.movie.voteAverage.toString()} \/ 10',
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Votes Count : ',
                            value: state.movie.voteCount.toString(),
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Orginal Language : ',
                            value: state.movie.originalLanguage!,
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Budget : ',
                            value: '${state.movie.budget.toString()} \$',
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfo(
                            title: 'Revenue : ',
                            value: '${state.movie.revenue.toString()} \$',
                          ),
                          const Divider(
                              color: Colors.grey, height: 30, thickness: 1),
                          MovieInfoList(
                            title: 'Companies',
                            values: state.movie.productionCompanies!,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    state.movie.productionCompanies!.length,
                                    (index) {
                                  return (state
                                              .movie
                                              .productionCompanies![index]
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
                                                    '${state.movie.productionCompanies![index].logoPath}'),
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
                              style: GoogleFonts.nunito(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original'
                                '${state.movie.posterPath}',
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeholder: (context, url) => Image.asset(
                              'assets/images/movie.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          );
        } else if (state is MovieDetailsError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTap: () => context
                  .read<MovieDetailsBloc>()
                  .add(GetMovieDetails(movieID: selectedMovie.id!)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/tap_to_retry.png'),
                  Text(
                    'Error Getting Movie, Tap to Retry !',
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const MovieLoading();
        }
      },
    );
  }
}
