import 'package:dio/dio.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import '../models/slide_model.dart';

class MoviesWebServices {
  late Dio dio;

  MoviesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZDEwOWZmY2IzODM1N2M2YTZmNzA3MzRlNDYwMWQ5MiIsInN1YiI6IjY0NzNhMjY2YTg5NGQ2MDBjMjYwY2FkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lHlY30Y02hmU2BvNU6yv2hTcgV9e54YOLOSZg3PhXFU'
      },
    );
    dio = Dio(options);
  }

  Future<Page> getPopularMovies(int pageNumber) async {
    Response response = await dio.get('movie/popular');
    Page page = Page.fromJson(response.data);
    return page;
  }

  Future<MovieDetails> getMovieDetails(int movieID) async {
    Response response = await dio.get('movie/${movieID.toString()}');
    MovieDetails movieDetails = MovieDetails.fromJson(response.data);
    return movieDetails;
  }

  Future<Page> getSearchedMovies(String title) async {
    Response response =
        await dio.get('search/movie', queryParameters: {'query': title});
    Page page = Page.fromJson(response.data);
    return page;
  }
}
