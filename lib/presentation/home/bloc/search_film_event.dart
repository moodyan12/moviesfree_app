part of 'search_film_bloc.dart';

abstract class SearchFilmEvent extends Equatable {
  const SearchFilmEvent();

  @override
  List<Object> get props => [];
}

class SearchFilm extends SearchFilmEvent {
  final String query;

  SearchFilm(this.query);

  @override
  List<Object> get props => [query];
}
