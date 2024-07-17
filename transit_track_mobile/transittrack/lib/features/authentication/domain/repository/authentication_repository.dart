import 'package:dartz/dartz.dart';
import 'package:transittrack/core/error/failure.dart';
import 'package:transittrack/features/authentication/domain/entities/userCredential.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signup({
    required String phoneNumber,
    required String password,
    required String firstName,
    required String lastName,
    required String otp,
  });
  Future<Either<Failure, UserCredential>> login({
    required String phoneNumber,
    required String password,
    required bool rememberMe,
  });
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserCredential>> getUserCredential();
  Future<Either<Failure, Unit>> changePassword({
    required String phoneNumber,
    required String newPassword,
    required String confirmPassword,
    required String otp,
  });
  Future<Either<Failure, Unit>> forgetPassword({
    required String phoneNumber,
    required String otp,
  });
  Future<Either<Failure, Unit>> sendOtpVerification({
    required String phoneNumber,
    required bool isForForgotPassword,
  });
  Future<Either<Failure, Unit>> resendOtpVerification({
    required String phoneNumber,
  });
  Future<Either<Failure, Unit>> initializeApp();
  Future<Either<Failure, bool>> getAppInitialization();


  // Firestore
  Future<Either<Failure, void>> storeDeviceToken();
  Future<Either<Failure, void>> deleteDeviceToken();
}