import 'package:dio/dio.dart';
import '../../../base/model/base_error.dart';
import '../errors/api_error.dart';
import '../errors/error_type_enum.dart';

import '../../../../../models/form/form.dart';
import '../../../base/service/api/base_api_data_service.dart';
import '../../../constants/enums/http_request_enum.dart';
import '../../../constants/enums/http_response_status_enum.dart';
import '../../../extension/http_response_status_extension.dart';
import '../../locator/locator.dart';
import '../../network/network_manager.dart';

import 'dart:io';

class APIFormService implements BaseAPIDataService<Form> {
  static const endPoint = "/user/forms/";

  final NetworkManager _networkManager = getIt<NetworkManager>();

  ///Add register form user account
  ///
  ///It converts the [data] object to json and makes a
  ///GET request to the '/user/forms' endpoint of the api.
  ///
  ///Returns added form
  @override
  Future<Form> add(Form data) async {
    if (await _checkFormNameExists(data)) {
      throw APIError(type: APIErrorType.FORM_NAME_EXIST, message: "Form Name Exists");
    }
    try {
      final response = await _networkManager.coreDio.makeRequest<Form, Form>(endPoint,
          data: data.toJson(), method: HttpTypes.POST, parseModel: Form());
      return response;
    } catch (e) {
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
    throw BaseError(code: 0, message: "Unknown Error");
  }

  @override
  Future<Form> update(String id, Form newData) async {
    final path = endPoint + id + "/";
    try {
      final response = await _networkManager.coreDio.makeRequest<Form, Form>(path,
          data: newData.toJson(), method: HttpTypes.PUT, parseModel: Form());
      return response;
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
      }
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
    throw BaseError(code: 0, message: "Unknown Error");
  }

  @override
  Future<bool> delete(String id) async {
    try {
      final path = endPoint + id + "/";
      final Response response = await _networkManager.coreDio
          .makeRequest<dynamic, Form>(path, method: HttpTypes.DELETE, parseModel: Form());
      if (response.statusCode == HttpStatus.noContent) {
        return true;
      }
      return false;
    } catch (e) {
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
    throw BaseError(code: 0, message: "Unknown Error");
  }

  @override
  Future<List<Form>> fetchAll() async {
    try {
      final response = await _networkManager.coreDio
          .makeRequest<List<Form>, Form>(endPoint, method: HttpTypes.GET, parseModel: Form());
      return response;
    } catch (e) {
      print(e);
      NetworkManager.handleError(e);
    }
    //If the above return keyword doesn't work, it will throw an error
    throw BaseError(code: 0, message: "Unknown Error");
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
