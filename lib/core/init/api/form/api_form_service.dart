import 'package:dio/dio.dart';

import '../../../base/service/api/base_api_data_service.dart';
import '../../../constants/enums/http_response_status_enum.dart';
import '../../network/network_manager.dart';
import '../../../../../models/form/form.dart';
import '../../../extension/http_response_status_extension.dart';

class APIFormService implements BaseAPIDataService<Form> {
  static const endPoint = "/user/forms/";

  ///Add register form user accounts
  ///
  ///It converts the [data] object to json and makes a
  ///GET request to the '/user/forms' endpoint of the api.
  ///
  ///Returns added form
  @override
  Future<Form> add(Form data) async {
    try {
      //Make Request with Dio

      final Response response =
          await NetworkManager.instance.dio.post(endPoint, data: data.toJson());

      //Create new form object from response

      return Form.fromJson(response.data);
    } catch (e) {
      NetworkManager.handleError(e);
    }

    //If the above return keyword doesn't work, it will throw an error

    throw Exception();
  }

  @override
  Future<Form> update(String id, Form newData) async {
    final path = endPoint + id;
    try {
      final response =
          await NetworkManager.instance.dio.put(path, data: newData.toJson());
      return Form.fromJson(response.data);
    } catch (e) {
      NetworkManager.handleError(e);
    }
    throw Exception();
  }

  @override
  Future<bool> delete(String id) async {
    try {
      final path = endPoint + id;
      final Response response = await NetworkManager.instance.dio.delete(path);
      if (response.statusCode == HttpResponeStatus.NO_CONTENT.code) {
        return true;
      }
      return false;
    } catch (e) {
      NetworkManager.handleError(e);
    }
    throw Exception();
  }

  @override
  Future<List<Form>> fetchAll() async {
    List<Form> forms = [];
    try {
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
      // ignore: empty_catches
    } catch (e) {
      NetworkManager.handleError(e);
    }
    throw Exception();
  }
}
