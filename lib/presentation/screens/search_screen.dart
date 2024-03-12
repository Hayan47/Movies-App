import 'package:movies_app/logic/search_bloc/search_bloc.dart';
import 'package:movies_app/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final _searchTextController = TextEditingController();
  SearchScreen({super.key});

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
            context.read<SearchBloc>().add(GetSearchedMovies(query: value));
          },
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => _searchTextController.clear(),
              icon: const Icon(
                Icons.clear,
                color: Colors.white,
              )),
        ],
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoaded) {
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
                      itemBuilder: (context, index) => MovieItem(
                        movie: state.movies[index],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
        },
      ),
    );
  }
}
