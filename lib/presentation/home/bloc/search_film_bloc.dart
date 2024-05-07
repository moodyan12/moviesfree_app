import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_clean_arch/core/core.dart';

part 'search_film_event.dart';

class SearchFilmBloc extends Bloc<SearchFilmEvent, BaseState<List<Film>>> {
  final FilmRepository filmRepository;
  SearchFilmBloc(this.filmRepository) : super(const InitializedState()) {
    on<SearchFilm>((event, emit) async {
      emit(const LoadingState());
      final result = await filmRepository.searchFilm(event.query);
      result.fold(
        (failure) => emit(ErrorState(
          message: failure.message,
        )),
        (data) => emit(LoadedState(data: data)),
      );
    });
  }
}
