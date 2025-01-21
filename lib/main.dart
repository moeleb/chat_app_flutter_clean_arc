import 'package:chatapp/chat_page.dart';
import 'package:chatapp/core/theme/theme.dart';
import 'package:chatapp/features/auth/data/datasoruce/remote_data_soruce/auth_remote_data_soruce.dart';
import 'package:chatapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chatapp/features/auth/domain/usecase/login_use_case.dart';
import 'package:chatapp/features/auth/domain/usecase/register_use_case.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/pages/login_page.dart';
import 'package:chatapp/features/auth/presentation/pages/register_page.dart';
import 'package:chatapp/features/conversation/data/datasource/remotedatasource/conversation_remote_data_soruce.dart';
import 'package:chatapp/features/conversation/data/repositories/conversation_repository.dart';
import 'package:chatapp/features/conversation/domain/usecases/fetch_conversation_use_case.dart';
import 'package:chatapp/features/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:chatapp/features/conversation/presentation/bloc/conversation_event.dart';
import 'package:chatapp/features/conversation/presentation/pages/conversation_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        ),
        BlocProvider(
          create: (_) => ConversationBloc(
              fetchConversationUseCase: FetchConversationUseCase(
                  ConversationRepositoryImpl(
                      remoteDataSource: ConversationRemoteDataSource()))),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        home: const RegisterPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/chatPage': (_) => const ChatPage(),
          '/conversationPage': (_) => const ConversationPage(),
        },
      ),
    );
  }
}
