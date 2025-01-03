import 'package:chatapp/features/auth/data/datasoruce/remote_data_soruce/auth_remote_data_soruce.dart';
import 'package:chatapp/features/auth/domain/entity/user_entity.dart';
import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(email, password) async {
    return await authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register(username, email, password) async {
    return await authRemoteDataSource.register(
        username: username, email: email, password: password);
  }
}
