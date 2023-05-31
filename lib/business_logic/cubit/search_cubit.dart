import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/movie.dart';
import '../../data/repository/movies_repository.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MoviesRepository moviesRepository;

  SearchCubit(this.moviesRepository) : super(SearchInitial());
  void getSearchedMovies(String title) async {
    emit(SearchLoading());
    try {
      moviesRepository.getSearchedMovies(title).then((searchedMovies) {
        emit(SearchLoaded(searchedMovies));
      });
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
