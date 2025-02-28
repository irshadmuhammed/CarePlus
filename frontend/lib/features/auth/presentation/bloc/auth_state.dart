part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  final AuthSuccessType? type;

  AuthSuccess({
    required this.user,
    this.type,
  });
}

class AuthProcessing extends AuthState {
  final String? message;

  AuthProcessing({this.message});
}

class AuthFailure extends AuthState {
  final String? error;
  final AuthFailureType type;

  AuthFailure({this.error, this.type = AuthFailureType.unexpected});
}

class UserAuthState extends AuthState {}

class DoctorAuthState extends AuthState {}

class SessionExpiredState extends AuthState {}
