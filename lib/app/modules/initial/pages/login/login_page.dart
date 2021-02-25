import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: [
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Column(
                children: [
                  Text(
                    'LF Rastreio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Mantenha a segurança do veículo na palma da sua mão! A LF Tecnologia te protege a todo momento!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Column(
                  children: [
                    Text(
                      'Entre agora para continuar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: controller.usernameCtrl,
                      decoration: InputDecoration(
                        hintText: 'Usuário',
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa colocar um usuário';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: controller.passwordCtrl,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Você precisa colocar uma senha';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    Container(
                      height: 48,
                      width: double.maxFinite,
                      child: ArgonButton(
                        height: 48,
                        width: double.maxFinite,
                        borderRadius: 8,
                        color: Colors.amber,
                        onTap: controller.login,
                        elevation: 0,
                        loader: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 24,
                        ),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
