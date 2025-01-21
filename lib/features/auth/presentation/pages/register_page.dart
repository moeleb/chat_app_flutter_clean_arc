import 'package:chatapp/core/theme/theme.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:chatapp/features/auth/presentation/widget/auth_button.dart';
import 'package:chatapp/features/auth/presentation/widget/auth_input_field.dart';
import 'package:chatapp/features/auth/presentation/widget/login_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterEvent(
        username: _usernameController.text,
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
                controller: _usernameController,
                hint: 'Username'),
            SizedBox(
              height: 20,
            ),
            AuthInputField(
                icon: Icons.email, controller: _emailController, hint: 'Email'),
            SizedBox(
              height: 20,
            ),
            AuthInputField(
                icon: Icons.lock,
                controller: _passwordController,
                hint: 'Password',
                isPassword: true),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamed(context, '/login');
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
            AuthButton(text: "Register", onPressed: _onRegister),
            SizedBox(
              height: 15,
            ),
            LoginPrompt(
                title: "Already Have an account?",
                subTitle: "Click here to login",
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                })
          ],
        ),
      ),
    );
  }
}
