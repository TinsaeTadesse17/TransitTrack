import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  abstract final String errorMessage;
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  final String errorMessage;
  ServerFailure({this.errorMessage = 'Server failure'});
}

class CacheFailure extends Failure {
  @override
  final String errorMessage;
  CacheFailure({this.errorMessage = 'Cache failure'});
}

class NetworkFailure extends Failure {
  @override
  final String errorMessage;
  NetworkFailure({this.errorMessage = 'No internet connection'});
}

class UnauthorizedRequestFailure extends Failure {
  @override
  final String errorMessage;

  UnauthorizedRequestFailure({this.errorMessage = 'User not authenticated'});
}

class AnonymousFailure extends Failure {
  @override
  final String errorMessage;
  AnonymousFailure({this.errorMessage = 'Unknown error happened'});
}

class CreateQuizFailure extends Failure {
  @override
  final String errorMessage;

  CreateQuizFailure({required this.errorMessage});
}

class AuthenticationFailure extends Failure {
  @override
  final String errorMessage;

  AuthenticationFailure({
    required this.errorMessage,
  });
}

class DeviceTokenNotFoundFailure extends Failure {
  @override
  final String errorMessage;

  DeviceTokenNotFoundFailure({required this.errorMessage});
}
