import 'package:movies_app/business_logic/cubit/movies_cubit.dart';
import 'package:movies_app/constants/strings.dart';
import 'package:movies_app/data/models/movie.dart';
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
  List<Movie> searchedForMovies = [];
  bool isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getPopularMovies();
    // print('allCarsList:');
    // print(allMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: isSearching
            ? TextField(
                controller: _searchTextController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Find A Movie..',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                onChanged: (searchedMovie) {
                  searchedForMovies = allMovies
                      .where((movie) =>
                          movie.title!.toLowerCase().startsWith(searchedMovie))
                      .toList();
                  setState(() {});
                },
              )
            : const Text(
                'Popular Movies',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
        actions: isSearching
            ? [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _searchTextController.clear();
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ))
              ]
            : [
                IconButton(
                  onPressed: () {
                    ModalRoute.of(context)!
                        .addLocalHistoryEntry(LocalHistoryEntry(
                      onRemove: () {
                        setState(() {
                          _searchTextController.clear();
                          isSearching = false;
                        });
                      },
                    ));

                    setState(() {
                      isSearching = true;
                    });
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
            allMovies = (state).characters;
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
                      itemCount: _searchTextController.text.isEmpty
                          ? allMovies.length
                          : searchedForMovies.length,
                      itemBuilder: (context, index) => MovieItem(
                        movie: _searchTextController.text.isEmpty
                            ? allMovies[index]
                            : searchedForMovies[index],
                      ),
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
