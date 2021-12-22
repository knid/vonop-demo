import 'package:flutter/material.dart';

import '../api/form/api_form_service.dart';
import '../locator/locator.dart';

import '../../../models/form/form.dart' as model;

class FormProvider extends ChangeNotifier {
  Future<List<model.Form>> getForms() async {
    APIFormService apiFormService = getIt<APIFormService>();
    return await apiFormService.fetchForms();
  }

  test() async {
    print("test");
    await getForms();
    notifyListeners();
  }
}
