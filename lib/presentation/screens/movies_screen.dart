import 'package:movies_app/business_logic/cubit/movies_cubit.dart';
import 'package:movies_app/constants/strings.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/presentation/widgets/loading_widget.dart';
import 'package:movies_app/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> allMovies = [];

  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, searchScreen);
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
                Navigator.pushNamed(context, favoriteScreen);
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
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoaded) {
            allMovies = (state).movies;
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
                      itemCount: allMovies.length,
                      itemBuilder: (context, index) =>
                          MovieItem(movie: allMovies[index]),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const ShimmerWidget();
          }
        },
      ),
    );
  }
}
