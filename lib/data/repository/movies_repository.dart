import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;

  MoviesRepository(this.moviesWebServices);

  Future<List<Movie>> getPopularMovies() async {
    final movies = await moviesWebServices.getPopularMovies();
    return movies; //.map((movie) => Movie.fromJson(movie)).toList();
  }

  // Future<List<Quote>> getQuotes(String characterName) async {
  //   final quotes = await moviesWebServices.getQuotes(characterName);
  //   return quotes
  //       .map((characterQuotes) => Quote.fromJson(characterQuotes))
  //       .toList();
  // }
}
