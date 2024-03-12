import 'package:movies_app/data/models/movie_model.dart';

class Page {
  int? pageNumber;
  List<Movie>? movies;
  int? totalPages;
  int? totalResults;

  Page({this.pageNumber, this.movies, this.totalPages, this.totalResults});

  Page.fromJson(Map<String, dynamic> json) {
    pageNumber = json['page'];
    movies = json['results']
            ?.map<Movie>((movie) => Movie.fromJson(movie))
            .toList() ??
        [];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['page'] = pageNumber;
  //   if (movies != null) {
  //     data['results'] = movies!.map((v) => v.toJson()).toList();
  //   }
  //   data['total_pages'] = totalPages;
  //   data['total_results'] = totalResults;
  //   return data;
  // }
}
