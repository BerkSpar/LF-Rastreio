import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:fl_rastreio/app/shared/repositories/lf_rastreio_api_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<LfRastreioApiRepository>();
  final refreshController = RefreshController();

  @observable
  List<Vehicle> vehicles = [];

  onRefresh() async {
    vehicles = await api.getVehicles();

    refreshController.refreshCompleted();
  }
}
