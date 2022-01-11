import 'package:vonop/core/base/notifier/base_data_notifier.dart';

import '../../api/form/api_form_service.dart';
import '../../locator/locator.dart';

import '../../../../models/form/form.dart' as model;

class FormProvider extends BaseDataNotifier<model.Form> {
  List<model.Form> _forms = [];

  List<model.Form> get forms => _forms;

  set forms(List<model.Form> forms) {
    _forms = forms;
    notifyListeners();
  }

  ///Get all forms via APIFormService
  @override
  Future<List<model.Form>> getAll() async {
    // Get registered APIFormService object
    APIFormService apiFormService = getIt<APIFormService>();
    //Fetch all forms via API
    List<model.Form> forms = await apiFormService.fetchAll();
    //Update this.forms variable and notify listeners
    this.forms = forms;

    return forms;
  }

  @override
  Future<model.Form> add(model.Form data) async {
    APIFormService apiFormService = getIt<APIFormService>();
    model.Form form = await apiFormService.add(data);
    await getAll();
    return form;
  }

  @override
  Future<model.Form> update(String id, model.Form data) async {
    APIFormService apiFormService = getIt<APIFormService>();
    model.Form form = await apiFormService.update(id, data);
    await getAll();
    return form;
  }

  @override
  Future<bool> delete(String id) async {
    APIFormService apiFormService = getIt<APIFormService>();
    bool deleted = await apiFormService.delete(id);
    if (deleted) await getAll();
    return deleted;
  }
}
