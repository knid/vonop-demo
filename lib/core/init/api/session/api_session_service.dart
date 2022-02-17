import 'package:get_it/get_it.dart';
import 'package:vonop/core/base/service/api/base_api_data_service.dart';
import 'package:vonop/core/init/network/network_manager.dart';
import 'package:vonop/models/form/form.dart';
import 'package:vonop/models/session/session.dart';
import 'package:vonop/models/session/session_credentials.dart';

class APISessionService {
  static const String endPoint = "/session/data/";

  final NetworkManager _networkManager = GetIt.I<NetworkManager>();
  Future<void> authorize({required SessionCredentials credentials, required Form form}) async {
    final String path = endPoint + credentials.publicKey;
    final response = await _networkManager.coreDio.post(
      path,
      data: {
        'session': credentials.sessionKey,
        'register_form': form.formId,
      },
    );
    print("********start***********");
    print(response.statusCode);
    print("********status");
    print(response.data);
    print("********data");
  }

  deauthorize() async {}
}
