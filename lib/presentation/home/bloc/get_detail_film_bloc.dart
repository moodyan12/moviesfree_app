import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_detail_film_event.dart';
part 'get_detail_film_state.dart';

class GetDetailFilmBloc extends Bloc<GetDetailFilmEvent, GetDetailFilmState> {
  GetDetailFilmBloc() : super(GetDetailFilmInitial()) {
    on<GetDetailFilmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
