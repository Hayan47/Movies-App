import 'package:dio/dio.dart';
import '../models/movie.dart';

class MoviesWebServices {
  late Dio dio;

  MoviesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie/',
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

  Future<List<Movie>> getPopularMovies() async {
    try {
      Response response = await dio.get('popular');
      Slide slide = Slide.fromJson(response.data);
      //print('RESPONSEEEEEEEEEEEEE' + slide.toString());
      return slide.results!;
    } catch (e) {
      print('ERORRRRRRRRRRRRRRRRRWEB' + e.toString());
      return [];
    }
  }

  // Future<List<dynamic>> getQuotes(String characterName) async {
  //   try {
  //     Response response =
  //         await dio.get('quote', queryParameters: {'auther': characterName});
  //     return response.data;
  //   } catch (e) {
  //     // print(e.toString());
  //     return [];
  //   }
  // }
}
