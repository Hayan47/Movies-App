import 'package:bloc/bloc.dart';
import 'package:movies_app/data/models/movie.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<List<Movie>> {
  FavoriteCubit(super.initialState);

  void addToList(Movie movie) {
    state.add(movie);
    emit(List.of(state));
  }

  void removeFromList(Movie movie) {
    state.remove(movie);
    emit(List.of(state));
  }
}
