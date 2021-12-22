import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../models/form/form.dart';

class APIFormService {
  static const endPoint = "/forms";
  static const fullPath = AppConstants.API_BASE_URL + endPoint;

  Future<List<Form>> fetchForms() async {
    // await http.get(
    //   Uri.parse(fullPath),
    //   headers: {
    //     "Authorization": "Token aaa",
    //   },
    // );
    return [];
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
