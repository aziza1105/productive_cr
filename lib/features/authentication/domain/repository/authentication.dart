import 'package:productive_cr/core/either/either.dart';
import 'package:productive_cr/features/authentication/domain/entity/authenticated_user.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticatedUserEntity>> getUser();

  Future<Either<Failure, AuthenticatedUserEntity>> login(String email, String password);

  Future<Either<Failure, AuthenticatedUserEntity>> createUser(String email, String password);

  Future<Either<Failure, void>> logout();
}