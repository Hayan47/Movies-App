import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/logic/favorite_bloc/favorite_bloc.dart';
import 'package:movies_app/logic/movie_bloc/movie_bloc.dart';
import 'package:movies_app/presentation/widgets/shimmer_all_movies.dart';
import 'package:movies_app/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(GetPopularMovies(pageNumber: 1));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Popular Movies',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'searchscreen');
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                context.read<FavoriteBloc>().add(GetFavoriteList());
                Navigator.pushNamed(context, 'favoritescreen');
              },
              child: Image.asset(
                'assets/icons/love2.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) =>
                          MovieItem(movie: state.movies[index]),
                    )
                  ],
                ),
              ),
            );
          } else if (state is MoviesError) {
            return GestureDetector(
              onTap: () => context
                  .read<MovieBloc>()
                  .add(GetPopularMovies(pageNumber: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/tap_to_retry.png'),
                  Text(
                    'Error Getting Movies, Tap to Retry !',
                    style:
                        GoogleFonts.nunito(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return const AllMoviesLoading();
          }
        },
      ),
    );
  }
}
