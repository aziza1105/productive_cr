import 'package:productive_cr/core/either/either.dart';
import 'package:productive_cr/core/failure/failure.dart';
import 'package:productive_cr/core/usecase/usecase.dart';
import 'package:productive_cr/features/authentication/domain/repository/authentication.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
