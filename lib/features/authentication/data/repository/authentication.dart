import 'package:productive_cr/core/either/either.dart';
import 'package:productive_cr/core/exception/exception.dart';
import 'package:productive_cr/core/failure/failure.dart';
import 'package:productive_cr/features/authentication/data/models/authenticated_user.dart';
import 'package:productive_cr/features/authentication/domain/entity/authenticated_user.dart';
import 'package:productive_cr/features/authentication/domain/repository/authentication.dart';

import '../data_source/remote.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _dataSource;

  const AuthenticationRepositoryImpl(
      {required AuthenticationRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUserEntity>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }


  @override
  Future<Either<Failure, AuthenticatedUserEntity>> createUser(
      String email, String password) async {
    try {
      final user = await _dataSource.createUser(email, password);
      return Right(AuthenticatedUserModel.fromFirebaseUser(user));
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }


  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _dataSource.logout();
      return Right(response);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message, code: error.code));
    }
  }
}
