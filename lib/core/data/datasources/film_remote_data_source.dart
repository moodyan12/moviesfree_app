import '../../../common/common.dart';
import '../../core.dart';

abstract class FilmRemoteDataSource {
  Future<List<Film>> getFilm();
  Future<Film> getDetailFilm(String id);
  Future<List<Film>> searchFilm(String query);
}

class FilmRemoteDataSourceImpl implements FilmRemoteDataSource {
  final DioClient dioClient;

  FilmRemoteDataSourceImpl({
    required this.dioClient,
  });

  @override
  Future<List<Film>> getFilm() async {
    final response = await dioClient.get(url: '/movies');
    if (response.statusCode == 200) {
      final List<Film> films = (response.data as List).map((data) => Film.fromJson(data)).toList();
      return films;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Film> getDetailFilm(String id) async {
    final response = await dioClient.get(url: 'https://663a16701ae792804bee02ef.mockapi.io/movies/$id');
    if (response.statusCode == 200) {
      final Film film = Film.fromJson(response.data);
      return film;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Film>> searchFilm(String query) async {
    final response = await dioClient.get(url: '/movies?search=$query');
    if (response.statusCode == 200) {
      final List<Film> films = (response.data as List).map((data) => Film.fromJson(data)).toList();
      return films;
    } else {
      throw ServerException();
    }
  }
}
