import '../../network/network_manager.dart';

import '../../../../../models/form/form.dart';

class APIFormService {
  static const endPoint = "/user/forms/";

  Future<List<Form>> fetchForms() async {
    List<Form> forms = [];
    final response = (await NetworkManager.instance.dio.get(endPoint));
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        for (var i in data) {
          final Form form = Form.fromJson(i);
          forms.add(form);
        }
      }
    }
    print(forms[0].firstName);
    return forms;
  }

  Future<Form> addForm(Form form) {
    return Future.value(form);
  }

  Future<Form> updateForm(String formId, Form form) {
    return Future.value(form);
  }

  Future<bool> deleteForm(String formId) {
    return Future.value(false);
  }
}
