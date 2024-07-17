import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:transittrack/core/error/failure.dart';
import 'package:transittrack/core/usecases/usecases.dart';
import 'package:transittrack/features/authentication/domain/entities/userCredential.dart';
import 'package:transittrack/features/authentication/domain/repository/authentication_repository.dart';

class LoginUsecase extends UseCase<UserCredential, LoginParams> {
  final AuthenticationRepository repository;

  LoginUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return await repository.login(
      phoneNumber: params.phoneNumber,
      password: params.password,
      rememberMe: params.rememberMe,
    );
  }
}

class LoginParams extends Equatable {
  final String phoneNumber;
  final String password;
  final bool rememberMe;

  const LoginParams({
    required this.phoneNumber,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object?> get props => [phoneNumber, password, rememberMe];
}