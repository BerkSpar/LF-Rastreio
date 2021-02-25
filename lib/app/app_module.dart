import 'widgets/vehicle_bottom/vehicle_bottom_controller.dart';
import 'shared/repositories/lf_rastreio_api_repository.dart';
import 'widgets/vehicle_card/vehicle_card_controller.dart';
import 'package:fl_rastreio/app/modules/initial/initial_module.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:fl_rastreio/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $VehicleBottomController,
        $LfRastreioApiRepository,
        $VehicleCardController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: InitialModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
