import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:equatable/equatable.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  late SharedPreferences prefs;
  List<Movie> favorites = [];
  FavoriteBloc() : super(FavoriteInitial()) {
    init();
    on<AddToFavorite>((event, emit) async {
      try {
        emit(FavoriteLoading());
        favorites = await getFavoriteMovies();
        favorites.add(event.movie);
        await saveFavoriteMovies(favorites);
        emit(FavoriteUpdated(favorites));
      } catch (e) {
        emit(FavoriteError('Error Adding Movie'));
      }
    });

    on<RemoveFromFavorite>((event, emit) async {
      try {
        emit(FavoriteLoading());
        favorites = await getFavoriteMovies();
        favorites.remove(event.movie);
        await saveFavoriteMovies(favorites);
        emit(FavoriteUpdated(favorites));
      } catch (e) {
        emit(FavoriteError('Error Removing Movie'));
      }
    });

    on<GetFavoriteList>((event, emit) async {
      try {
        emit(FavoriteLoading());
        favorites = await getFavoriteMovies();
        emit(FavoriteUpdated(favorites));
      } catch (e) {
        emit(FavoriteError('Error Getting Favorite List'));
      }
    });
  }

  Future<List<Movie>> getFavoriteMovies() async {
    final String? encodedMovies = prefs.getString('favorite_movies');
    if (encodedMovies == null) {
      return [];
    }
    final List<dynamic> decodedMovies = jsonDecode(encodedMovies);
    final List<Movie> movies = decodedMovies
        .cast<Map<String, dynamic>>()
        .map((movieMap) => Movie.fromJson(movieMap))
        .toList();
    return movies;
  }

  Future<void> saveFavoriteMovies(List<Movie> movies) async {
    final List<Map<String, dynamic>> movieMaps =
        movies.map((movie) => movie.toJson()).toList();
    final String encodedMovies = jsonEncode(movieMaps);
    await prefs.setString('favorite_movies', encodedMovies);
  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
}
