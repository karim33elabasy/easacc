import 'package:dartz/dartz.dart';
import 'package:easacc/core/failure/failure.dart';
import 'package:easacc/core/usecases/main_usecase.dart';
import 'package:easacc/core/usecases/no_params.dart';
import 'package:easacc/features/authentication/domain/repo/auth_repo.dart';

class GoogleLoginUseCase extends MainUseCase<Unit, NoParams> {
  final AuthRepo authRepo;
  const GoogleLoginUseCase({required this.authRepo});

  @override
  Future<Either<Failure, Unit>> call({required NoParams params}) {
    return authRepo.googleLogin();
  }

}