import 'package:bloc/bloc.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/repository/movies_repository.dart';
import 'package:flutter/material.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;

  List<Movie> movies = [];

  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<Movie> getPopularMovies() {
    moviesRepository.getPopularMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });
    return movies;
  }
}
