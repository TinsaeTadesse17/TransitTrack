// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserCredential extends Equatable {
  final String id;
  final String? email;
  final String fullName;
  final String? password;
  final String phoneNumber;
  final String? otp;
  final String? token;
  final String? profileAvatar;

  const UserCredential(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      this.email,
      this.password,
      this.otp,
      this.token,
      this.profileAvatar,
      });

  @override
  List<Object?> get props => [
        id,
        email,
        phoneNumber,
        fullName,
      ];

  UserCredential copyWith({
    String? id,
    String? email,
    String? phomeNumber,
    String? fullName,
    String? password,
    String? otp,
    String? token,
  }) {
    return UserCredential(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      token: token ?? this.token,
    );
  }
}
