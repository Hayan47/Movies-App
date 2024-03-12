import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/logic/favorite_bloc/favorite_bloc.dart';
import 'package:movies_app/logic/movie_bloc/movie_bloc.dart';
import 'package:movies_app/logic/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/logic/search_bloc/search_bloc.dart';
import 'package:movies_app/presentation/screens/favorite_screen.dart';
import 'package:movies_app/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/presentation/screens/all_movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/screens/search_screen.dart';

class AppRouter {
  late MovieDetailsBloc movieDetailsBloc;
  late SearchBloc searchBloc;
  late MovieBloc movieBloc;
  late FavoriteBloc favoriteBloc;

  AppRouter() {
    movieDetailsBloc = MovieDetailsBloc();
    searchBloc = SearchBloc();
    movieBloc = MovieBloc();
    favoriteBloc = FavoriteBloc();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: movieBloc),
              BlocProvider.value(value: movieDetailsBloc),
              BlocProvider.value(value: favoriteBloc),
            ],
            child: const MoviesScreen(),
          ),
        );
      case 'moviedetailscreen':
        final Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: movieDetailsBloc),
              BlocProvider.value(value: favoriteBloc),
            ],
            child: MovieDetailsScreen(selectedMovie: movie),
          ),
        );
      case 'favoritescreen':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: favoriteBloc),
              BlocProvider.value(value: movieDetailsBloc),
            ],
            child: const FavoriteScreen(),
          ),
        );
      case 'searchscreen':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: searchBloc),
              BlocProvider.value(value: movieDetailsBloc),
              BlocProvider.value(value: favoriteBloc),
            ],
            child: SearchScreen(),
          ),
        );
    }
    return null;
  }
}
