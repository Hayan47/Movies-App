import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/logic/favorite_bloc/favorite_bloc.dart';
import 'package:movies_app/presentation/widgets/movie_item.dart';
import 'package:movies_app/presentation/widgets/shimmer_all_movies.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          'Favorite Movies',
          style: GoogleFonts.karla(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
        if (state is FavoriteUpdated) {
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
                            mainAxisSpacing: 1),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) =>
                        MovieItem(movie: state.favorites[index]),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const AllMoviesLoading();
        }
      }),
    );
  }
}
