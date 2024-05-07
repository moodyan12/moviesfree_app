import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';

part 'get_film_event.dart';

class GetFilmBloc extends Bloc<GetFilmEvent, BaseState<List<Film>>> {
  final FilmRepository filmRepository;
  GetFilmBloc(this.filmRepository) : super(const InitializedState()) {
    on<FetchFilm>((event, emit) async {
      emit(const LoadingState());
      final result = await filmRepository.getFilm();
      result.fold(
        (failure) => emit(ErrorState(
          message: failure.message,
        )),
        (data) => emit(LoadedState(data: data)),
      );
    });
  }
}
