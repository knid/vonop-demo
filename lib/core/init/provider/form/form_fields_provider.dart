import 'package:flutter/material.dart';

import '../../../../models/form/form.dart' as model;
import '../../../../view/ui/widgets/input_field.dart';
import '../../../constants/app/app_constants.dart';

class FormFieldsProvider extends ChangeNotifier {
  FormFieldsProvider() {
    for (var item in _structure.keys) {
      textEditingControllers[item] = TextEditingController();
    }
    textEditingControllers['last_name'] = TextEditingController();
  }
  factory FormFieldsProvider.from(model.Form form) {
    var formFieldsProvider = FormFieldsProvider()
      ..textEditingControllers['form_name']?.text = form.formName ?? ""
      ..textEditingControllers['name']?.text = form.firstName ?? ""
      ..textEditingControllers['last_name']?.text = form.lastName ?? ""
      ..textEditingControllers['username']?.text = form.username ?? ""
      ..textEditingControllers['email']?.text = form.email ?? ""
      ..textEditingControllers['phone_number']?.text = form.phoneNumber ?? ""
      ..textEditingControllers['birthday']?.text = form.birthday ?? ""
      ..textEditingControllers['gender']?.text = form.gender ?? ""
      ..textEditingControllers['identity_id']?.text = form.identityId ?? ""
      ..textEditingControllers['address']?.text = form.address ?? ""
      ..textEditingControllers['password']?.text = form.password ?? "";

    formFieldsProvider._structure['name'] =
        form.firstName != null ? formFieldsProvider.nameAndLastName : null;
    formFieldsProvider._structure['username'] =
        form.username != null ? formFieldsProvider.username : null;
    formFieldsProvider._structure['email'] = form.email != null ? formFieldsProvider.email : null;
    formFieldsProvider._structure['phone_number'] =
        form.phoneNumber != null ? formFieldsProvider.phoneNumber : null;
    formFieldsProvider._structure['birthday'] =
        form.birthday != null ? formFieldsProvider.birthday : null;
    formFieldsProvider._structure['gender'] =
        form.gender != null ? formFieldsProvider.gender : null;
    formFieldsProvider._structure['identity_id'] =
        form.identityId != null ? formFieldsProvider.identityNo : null;
    formFieldsProvider._structure['address'] =
        form.address != null ? formFieldsProvider.address : null;
    formFieldsProvider._structure['password'] =
        form.password != null ? formFieldsProvider.password : null;

    return formFieldsProvider;
  }
  Map<String, Widget?> _structure = {
    'form_name': null,
    'name': null,
    'username': null,
    'email': null,
    'phone_number': null,
    'birthday': null,
    'gender': null,
    'identity_id': null,
    'address': null,
    'password': null,
  };
  Widget get formName => _buildFormNameField();
  Widget get nameAndLastName => _buildNameAndLastNameField();
  Widget get username => _buildUsernameField();
  Widget get email => _buildEmailField();
  Widget get phoneNumber => _buildPhoneNumberField();
  Widget get birthday => _buildBirthdayField();
  Widget get gender => _buildGenderField();
  Widget get identityNo => _buildIdentityNoField();
  Widget get address => _buildAddressField();
  Widget get password => _buildPasswordField();

  Map<String, Widget?> get structure => _structure;
  Map<String, TextEditingController> textEditingControllers = {};

  set structure(Map<String, Widget?> data) {
    _structure = data;
    notifyListeners();
  }

  Widget _buildFormNameField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['form_name'];
    return InputField(
        labelText: "*Form İsmi",
        maxLength: 20,
        enableFloatingLabelText: true,
        textEditingController: textEditingController);
  }

  Widget _buildNameAndLastNameField(
      [TextEditingController? textEditingControllerName,
      TextEditingController? textEditingControllerLastName]) {
    textEditingControllerName ??= textEditingControllers['name'];
    textEditingControllerLastName ??= textEditingControllers['last_name'];

    return Row(
      children: [
        Expanded(
          child: InputField(
            labelText: "İsim",
            enableFloatingLabelText: true,
            maxLength: 15,
            keyboardType: TextInputType.text,
            autoFillHints: const [AutofillHints.name],
            textEditingController: textEditingControllerName,
          ),
        ),
        Expanded(
          child: InputField(
            labelText: "Soyisim",
            maxLength: 15,
            enableFloatingLabelText: true,
            keyboardType: TextInputType.text,
            textEditingController: textEditingControllerLastName,
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['username'];
    return InputField(
      labelText: "Kullanıcı Adı",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
    );
  }

  Widget _buildEmailField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['email'];
    return InputField(
      labelText: "E-Mail",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
      validator: (val) {
        if (val != null) {
          if (!ApplicationConstants.EMAIL_REGEX.hasMatch(val)) {
            return "Lütfen Geçerli Bir Email Adresi Girin";
          }
        }
      },
    );
  }

  Widget _buildPhoneNumberField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['phone_number'];
    return InputField(
      labelText: "Telefon Numarası",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildBirthdayField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['birthday'];
    return InputField(
      labelText: "Doğum Günü",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
    );
  }

  Widget _buildGenderField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['gender'];
    return InputField(
      labelText: "Cinsiyet",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
    );
  }

  Widget _buildIdentityNoField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['identity_id'];
    return InputField(
      labelText: "Kimlik Numarası",
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
    );
  }

  Widget _buildAddressField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['address'];
    return InputField(
      labelText: "Adres",
      height: 80,
      maxLines: 3,
      maxLength: 200,
      enableFloatingLabelText: true,
      textEditingController: textEditingController,
    );
  }

  Widget _buildPasswordField([TextEditingController? textEditingController]) {
    textEditingController ??= textEditingControllers['password'];
    return InputField(
      labelText: "Parola",
      enableFloatingLabelText: true,
      obscureText: true,
      autoFillHints: const [AutofillHints.newPassword],
      textEditingController: textEditingController,
    );
  }
}
