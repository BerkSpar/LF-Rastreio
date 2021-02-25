import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'lf_rastreio_api_repository.g.dart';

@Injectable()
class LfRastreioApiRepository extends Disposable {
  Dio client = Dio();
  BaseOptions options = BaseOptions(
    baseUrl: 'https://rastrear.lftecnologia.com.br/api',
  );

  LfRastreioApiRepository() {
    client.options = options;
    client.options.responseType = ResponseType.json;
  }

  Future<bool> signIn(String username, String password) async {
    try {
      final response = await client.post('/auth/token/', data: {
        "username": username,
        "password": password,
      });

      options.headers['Authorization'] = 'Token ${response.data['token']}';

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {}
}
