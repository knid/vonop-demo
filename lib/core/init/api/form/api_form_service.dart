import 'package:dio/dio.dart';
import 'package:vonop/core/constants/enums/api_error_enum.dart';

import '../../../base/service/api/base_api_data_service.dart';
import '../../../constants/enums/http_response_status_enum.dart';
import '../../network/network_manager.dart';
import '../../../../../models/form/form.dart';
import '../../../extension/http_response_status_extension.dart';

class APIFormService implements BaseAPIDataService<Form> {
  static const endPoint = "/user/forms/";

  ///Add register form user account
  ///
  ///It converts the [data] object to json and makes a
  ///GET request to the '/user/forms' endpoint of the api.
  ///
  ///Returns added form
  @override
  Future<Form> add(Form data) async {
    if (await _checkFormNameExists(data)) {
      throw APIError(APIErrorType.FORM_NAME_EXIST);
    }

    try {
      final Response response =
          await NetworkManager.instance.dio.post(endPoint, data: data.toJson());
      return Form.fromJson(response.data);
    } catch (e) {
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
    throw Exception();
  }

  @override
  Future<Form> update(String id, Form newData) async {
    if (await _checkFormNameExists(newData)) {
      throw APIError(APIErrorType.FORM_NAME_EXIST);
    }
    final path = endPoint + id;
    try {
      final response =
          await NetworkManager.instance.dio.put(path, data: newData.toJson());
      return Form.fromJson(response.data);
    } catch (e) {
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
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
    //If the above return keyword doesn't work, it will throw an error
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
    //If the above return keyword doesn't work, it will throw an error
    throw Exception();
  }

  ///Check if formName exists.
  ///
  ///Fetch all the user's forms and compares them with the [form] value.
  ///
  ///If exists, return true
  ///
  ///If not, return false
  Future<bool> _checkFormNameExists(Form form) async {
    for (Form data in (await fetchAll())) {
      if (data.formName == form.formName) {
        return true;
      }
    }
    return false;
  }
}
