import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'vehicle_card_controller.g.dart';

@Injectable()
class VehicleCardController = _VehicleCardControllerBase
    with _$VehicleCardController;

abstract class _VehicleCardControllerBase with Store {}
