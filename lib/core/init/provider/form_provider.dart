import 'package:flutter/material.dart';
import 'package:vonop/core/base/notifier/base_data_notifier.dart';

import '../api/form/api_form_service.dart';
import '../locator/locator.dart';

import '../../../models/form/form.dart' as model;

class FormProvider extends ChangeNotifier with BaseDataNotifier<model.Form> {
  @override
  Future<List<model.Form>> getAll() async {
    APIFormService apiFormService = getIt<APIFormService>();
    List<model.Form> forms = await apiFormService.fetchAll();
    return forms;
  }

  @override
  Future<model.Form> add(model.Form data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<model.Form> update(String id, model.Form data) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String id) {
    throw UnimplementedError();
  }
}
