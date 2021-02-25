import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'vehicle_bottom_controller.g.dart';

@Injectable()
class VehicleBottomController = _VehicleBottomControllerBase
    with _$VehicleBottomController;

abstract class _VehicleBottomControllerBase with Store {}
