import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:fl_rastreio/app/shared/repositories/lf_rastreio_api_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<LfRastreioApiRepository>();

  @observable
  List<Vehicle> vehicles = [];

  onRefresh() async {
    vehicles = await api.getVehicles();
  }
}
