import 'package:fl_rastreio/app/shared/models/vehicle.dart';
import 'package:fl_rastreio/app/shared/repositories/lf_rastreio_api_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final api = Modular.get<LfRastreioApiRepository>();
  final refreshController = RefreshController();

  @observable
  List<Vehicle> vehicles = [];

  List<Map> urls = [
    {
      'link': 'https://github.com/BerkSpar',
      'description': 'Quem sou eu?',
    },
    {
      'link': 'http://www.lftecnologia.com.br/',
      'description': 'LF Tecnologia',
    },
    {
      'Link': 'https://github.com/BerkSpar/LF-Rastreio',
      'description': 'Mais sobre esse projeto'
    }
  ];

  onRefresh() async {
    vehicles = await api.getVehicles();

    refreshController.refreshCompleted();
  }

  about(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
