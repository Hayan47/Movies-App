import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final moviesWebServices = MoviesWebServices();

  SearchBloc() : super(SearchInitial()) {
    on<GetSearchedMovies>((event, emit) async {
      emit(SearchLoading());
      try {
        final searchedMovies =
            await moviesWebServices.getSearchedMovies(event.query);
        emit(SearchLoaded(movies: searchedMovies.movies ?? []));
      } catch (e) {
        emit(SearchError(message: e.toString()));
      }
    });
  }
}
