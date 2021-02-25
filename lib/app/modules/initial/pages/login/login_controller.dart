import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @action
  login(startLoading, stopLoading, btnState) async {
    startLoading();
    //get token and validation
    await Future.delayed(Duration(seconds: 2));
    stopLoading();

    Modular.to.pushReplacementNamed('/home');
  }

  @action
  createAccount() {}
}
