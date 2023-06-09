import 'package:movies_app/business_logic/cubit/favorite_cubit.dart';
import 'package:movies_app/business_logic/cubit/movie_details_cubit.dart';
import 'package:movies_app/business_logic/cubit/movies_cubit.dart';
import 'package:movies_app/business_logic/cubit/search_cubit.dart';
import 'package:movies_app/constants/strings.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';
import 'package:movies_app/presentation/screens/favorite_screen.dart';
import 'package:movies_app/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/screens/search_screen.dart';

class AppRouter {
  late MoviesRepository movieRepository;
  late MoviesCubit movieCubit;
  late MovieDetailsCubit movieDetailsCubit;
  late SearchCubit searchCubit;
  FavoriteCubit favoriteCubit = FavoriteCubit([]);

  AppRouter() {
    movieRepository = MoviesRepository(MoviesWebServices());
    movieCubit = MoviesCubit(movieRepository);
    movieDetailsCubit = MovieDetailsCubit(movieRepository);
    searchCubit = SearchCubit(movieRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case moviesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => movieCubit,
                  child: const MoviesScreen(),
                ));

      case movieDetailScreen:
        final selectedMovie = settings.arguments as Movie;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: movieDetailsCubit,
                  child: MovieDetailsScreen(
                    selectedMovie: selectedMovie,
                  ),
                ));

      case favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => const FavoriteScreen(),
        );

      case searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: searchCubit,
            child: const SearchScreen(),
          ),
        );
    }
    return null;
  }
}
