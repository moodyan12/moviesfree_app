part of 'get_film_bloc.dart';

abstract class GetFilmEvent extends Equatable {
  const GetFilmEvent();

  @override
  List<Object> get props => [];
}

class FetchFilm extends GetFilmEvent {}
