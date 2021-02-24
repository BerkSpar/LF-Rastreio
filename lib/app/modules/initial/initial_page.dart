import 'package:fl_rastreio/app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LFColors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/lf-logo.png'),
              SizedBox(height: 16),
              SpinKitWave(
                color: LFColors.lightBlue,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
