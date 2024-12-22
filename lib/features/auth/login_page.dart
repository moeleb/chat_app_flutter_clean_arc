import 'package:chatapp/core/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
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
            _buildTextInput('Email', Icons.person, _emailController),
            SizedBox(
              height: 20,
            ),
            _buildTextInput('Password', Icons.person, _passwordController,
                isPassword: true),
            SizedBox(
              height: 20,
            ),
            _buildLoginButton(),
            SizedBox(
              height: 15,
            ),
            _buildLoginPrompt(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInput(
      String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity, // Makes the button take the full width
      child: ElevatedButton(
        onPressed: () {
          // Add your button press logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 16), // Adjust text styling
        ),
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showInputValues();
        },
        child: RichText(
          text: TextSpan(
            text: "Dont have an account? ",
            style: TextStyle(
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                  text: "Click here to Register ",
                  style: TextStyle(
                    color: Colors.blue,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
