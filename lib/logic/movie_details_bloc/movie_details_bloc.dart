import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final moviesWebServices = MoviesWebServices();
  late MovieDetails movieDetails;
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<GetMovieDetails>((event, emit) async {
      try {
        emit(MovieDetailsLoading());
        movieDetails = await moviesWebServices.getMovieDetails(event.movieID);
        emit(MovieDetailsLoaded(movie: movieDetails));
      } catch (e) {
        emit(MovieDetailsError(message: 'Error Getting movie'));
      }
    });
  }
}
