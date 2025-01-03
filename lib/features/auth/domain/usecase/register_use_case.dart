import 'package:chatapp/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  call(String username, String email, String password) {
    return authRepository.register(username, email, password);
  }
}
