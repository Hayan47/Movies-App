import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/movie_details.dart';
import '../../data/repository/movies_repository.dart';
part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MoviesRepository moviesRepository;

  MovieDetailsCubit(this.moviesRepository) : super(MovieDetailsInitial());

  void getMovieDetails(int movieID) async {
    emit(MovieDetailsLoading());
    try {
      moviesRepository.getMovieDetails(movieID).then((movieDetails) {
        emit(MovieDetailsLoaded(movieDetails));
      });
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
