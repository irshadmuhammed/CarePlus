import 'package:dartz/dartz.dart';
import 'package:frontend/features/auth/domain/entities/session.dart';
import 'package:frontend/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<String, User>> register({
    String? email,
    String? registrationId,
    required String username,
    required String password,
    required String phone,
    required bool isPatient,
    required bool isDoctor,
  });

  Future<Either<String, (User, Session)>> login({
    String? email,
    String? registrationID,
    required String password,
  });

  // Future<String?> refreshToken();
}
