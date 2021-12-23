import 'package:flutter/material.dart';
import 'package:vonop/core/base/notifier/base_data_notifier.dart';

import '../api/form/api_form_service.dart';
import '../locator/locator.dart';

import '../../../models/form/form.dart' as model;

class FormProvider extends ChangeNotifier with BaseDataNotifier<model.Form> {
  @override
  Future<List<model.Form>> getAll() async {
    APIFormService apiFormService = getIt<APIFormService>();
    return await apiFormService.fetchAll();
  }
}
