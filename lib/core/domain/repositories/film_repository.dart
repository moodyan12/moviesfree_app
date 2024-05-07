import 'package:dartz/dartz.dart';
import '../../../common/common.dart';
import '../../core.dart';

abstract class FilmRepository {
  Future<Either<Failure, List<Film>>> getFilm();
  Future<Either<Failure, Film>> getDetailFilm(String id);
  Future<Either<Failure, List<Film>>> searchFilm(String query);
}
