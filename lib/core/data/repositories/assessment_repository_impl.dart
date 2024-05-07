import '../../../common/common.dart';
import '../../core.dart';
import 'package:dartz/dartz.dart';

class FilmRepositoryImpl implements FilmRepository {
  final FilmRemoteDataSource remoteDataSource;

  FilmRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Film>>> getFilm() async {
    try {
      final result = await remoteDataSource.getFilm();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, Film>> getDetailFilm(String id) async {
    try {
      final result = await remoteDataSource.getDetailFilm(id);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<Film>>> searchFilm(String query) async {
    try {
      final result = await remoteDataSource.searchFilm(query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    }
  }
}
