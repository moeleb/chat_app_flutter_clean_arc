import 'package:chatapp/core/theme/theme.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/widget/auth_button.dart';
import 'package:chatapp/features/auth/presentation/widget/auth_input_field.dart';
import 'package:chatapp/features/auth/presentation/widget/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLogin() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthInputField(
                icon: Icons.person,
                controller: _emailController,
                hint: 'Email'),
            SizedBox(
              height: 20,
            ),
            AuthInputField(
              icon: Icons.lock,
              controller: _passwordController,
              hint: 'Password',
              isPassword: true,
            ),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthSuccess) {
                print("go the the main page soon");
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            }, builder: (context, state) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
            SizedBox(
              height: 20,
            ),
            AuthButton(
              text: 'Login',
              onPressed: _onLogin,
            ),
            SizedBox(
              height: 15,
            ),
            LoginPrompt(
              title: "Don't have an account?",
              subTitle: "Click here to sign up",
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
            ),
          ],
        ),
      ),
    );
  }
}
