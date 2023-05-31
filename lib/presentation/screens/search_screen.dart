import 'package:movies_app/business_logic/cubit/search_cubit.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> allMovies = [];
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchTextController,
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Find A Movie..',
            hintStyle: TextStyle(color: Colors.white, fontSize: 18),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 18),
          onSubmitted: (value) {
            context.read<SearchCubit>().getSearchedMovies(value);
          },
        ),
        leading: IconButton(
          onPressed: () {
            allMovies.clear();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _searchTextController.clear();
                  allMovies.clear();
                });
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              )),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoaded) {
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
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }
}
