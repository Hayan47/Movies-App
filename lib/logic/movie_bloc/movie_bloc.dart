import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/web_services/movies_web_services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final moviesWebServices = MoviesWebServices();
  List<Movie> movies = [];
  MovieBloc() : super(MovieInitial()) {
    on<GetPopularMovies>((event, emit) async {
      try {
        emit(MoviesLoading());
        final page = await moviesWebServices.getPopularMovies(event.pageNumber);
        movies = page.movies ?? [];
        emit(MoviesLoaded(movies: movies));
      } catch (e) {
        emit(MoviesError(message: 'Error Fetching movies'));
      }
    });
  }
}
