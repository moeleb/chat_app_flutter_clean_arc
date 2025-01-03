import 'package:chatapp/chat_page.dart';
import 'package:chatapp/core/theme/theme.dart';
import 'package:chatapp/features/auth/data/datasoruce/remote_data_soruce/auth_remote_data_soruce.dart';
import 'package:chatapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chatapp/features/auth/domain/usecase/login_use_case.dart';
import 'package:chatapp/features/auth/domain/usecase/register_use_case.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/login_page.dart';
import 'package:chatapp/register_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            loginUseCase: LoginUseCase(
              authRepository: AuthRepositoryImpl(
                authRemoteDataSource: AuthRemoteDataSource(),
              ),
            ),
            registerUseCase: RegisterUseCase(
              authRepository: AuthRepositoryImpl(
                authRemoteDataSource: AuthRemoteDataSource(),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: const RegisterPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/chat': (_) => const ChatPage(),
        },
      ),
    );
  }
}
