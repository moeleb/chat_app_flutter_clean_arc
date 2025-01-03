import 'package:chatapp/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(email,password);
  Future<UserEntity> register(username,email,password);
}

