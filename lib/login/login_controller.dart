import 'package:flutter/painting.dart';
import 'package:notes/login/login_state.dart';
import 'package:notes/login/models/user_model.dart';

import 'login_service.dart';

class LoginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  final LoginService service;
  VoidCallback onUpdate;
  Function(LoginState state)? onChange;

  LoginController({required this.service, required this.onUpdate});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
