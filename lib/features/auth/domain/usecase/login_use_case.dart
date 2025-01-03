import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  call(String email, String password) {
    return authRepository.login(email, password);
  }
}
