import '../../../base/service/api/base_api_data_service.dart';
import '../../../constants/enums/http_response_status_enum.dart';
import '../../network/network_manager.dart';
import '../../../../../models/form/form.dart';
import '../../../extension/http_response_status_extension.dart';

class APIFormService implements BaseAPIDataService<Form> {
  static const endPoint = "/user/forms/";

  @override
  Future<Form> add(Form data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Form> update(String id, Form newData) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Form>> fetchAll() async {
    List<Form> forms = [];
    final response = (await NetworkManager.instance.dio.get(endPoint));
    if (response.statusCode == HttpResponeStatus.OK.code) {
      final data = response.data;
      if (data is List) {
        for (var i in data) {
          final Form form = Form.fromJson(i);
          forms.add(form);
        }
      }
    }
    return forms;
  }
}
