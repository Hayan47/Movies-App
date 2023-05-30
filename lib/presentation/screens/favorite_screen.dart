import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/data/models/movie.dart';

import '../../business_logic/cubit/favorite_cubit.dart';
import '../widgets/movie_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Favorite Movies',
          style: GoogleFonts.karla(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, List<Movie>>(
        builder: (context, state) {
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
                    itemCount: state.length,
                    itemBuilder: (context, index) =>
                        MovieItem(movie: state[index]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
