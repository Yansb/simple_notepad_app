import 'package:flutter/material.dart';
import 'package:notes/login/login_controller.dart';
import 'package:notes/login/login_service.dart';
import 'package:notes/login/login_state.dart';
import 'package:notes/login/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LoginButton(
          onTap: () {
            controller.googleSignIn();
          },
        ),
      ),
    );
  }
}
