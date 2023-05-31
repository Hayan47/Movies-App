import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';

import '../models/movie_details.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;

  MoviesRepository(this.moviesWebServices);

  Future<List<Movie>> getPopularMovies() async {
    final movies = await moviesWebServices.getPopularMovies();
    return movies; //.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<MovieDetails> getMovieDetails(int movieID) async {
    final movieDetails = await moviesWebServices.getMovieDetails(movieID);
    MovieDetails details = MovieDetails.fromJson(movieDetails);
    // details = movieDetails
    return details;
    // .map((movieDetails) => MovieDetails.fromJson(movieDetails));
  }

  Future<List<Movie>> getSearchedMovies(String title) async {
    final movies = await moviesWebServices.getSearchedMovies(title);
    return movies; //.map((movie) => Movie.fromJson(movie)).toList();
  }
}
