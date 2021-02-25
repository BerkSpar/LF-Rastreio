import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:fl_rastreio/app/shared/repositories/lf_rastreio_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final api = Modular.get<LfRastreioApiRepository>();

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @action
  login(startLoading, stopLoading, btnState) async {
    if (btnState == ButtonState.Busy) return;
    FocusScope.of(Modular.navigatorKey.currentContext).unfocus();
    if (!formKey.currentState.validate()) return;

    startLoading();
    final canLogin = await api.signIn(
      usernameCtrl.text,
      passwordCtrl.text,
    );
    stopLoading();

    if (canLogin) {
      Modular.to.pushReplacementNamed('/home');
    } else {
      asuka.showSnackBar(SnackBar(
        content: Text('Infelizmente não foi possivel entrar na sua conta'),
      ));
    }
  }

  @action
  createAccount() {}
}
