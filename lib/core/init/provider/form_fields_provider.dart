import 'package:flutter/material.dart';
import 'package:vonop/view/ui/widgets/input_field.dart';

class FormFieldsProvider extends ChangeNotifier {
  Map<String, Widget?> _structure = {
    'formName': _buildFormNameField(),
    'name': null,
    'username': null,
    'email': null,
    'phoneNumber': null,
    'birthday': null,
    'gender': null,
    'identityNo': null,
    'address': null,
    'password': null,
  };
  static Widget get formName => _buildFormNameField();
  static Widget get nameAndLastName => _buildNameAndLastNameField();
  static Widget get username => _buildUsernameField();
  static Widget get email => _buildEmailField();
  static Widget get phoneNumber => _buildPhoneNumberField();
  static Widget get birthday => _buildBirthdayField();
  static Widget get gender => _buildGenderField();
  static Widget get identityNo => _buildIdentityNoField();
  static Widget get address => _buildAddressField();
  static Widget get password => _buildPasswordField();

  Map<String, Widget?> get structure => _structure;
  set structure(Map<String, Widget?> data) {
    _structure = data;
    notifyListeners();
  }

  static Widget _buildFormNameField() {
    return inputField(hintText: "*Form İsmi");
  }

  static Widget _buildNameAndLastNameField() {
    return Row(
      children: [
        Expanded(
          child: inputField(
            hintText: "İsim",
          ),
        ),
        Expanded(
          child: inputField(
            hintText: "Soyisim",
          ),
        ),
      ],
    );
  }

  static Widget _buildUsernameField() {
    return inputField(hintText: "Kullanıcı Adı");
  }

  static Widget _buildEmailField() {
    return inputField(hintText: "E-Mail");
  }

  static Widget _buildPhoneNumberField() {
    return inputField(hintText: "Telefon Numarası");
  }

  static Widget _buildBirthdayField() {
    return inputField(hintText: "Doğum Günü");
  }

  static Widget _buildGenderField() {
    return inputField(hintText: "Cinsiyet");
  }

  static Widget _buildIdentityNoField() {
    return inputField(hintText: "Kimlik Numarası");
  }

  static Widget _buildAddressField() {
    return inputField(hintText: "Adres");
  }

  static Widget _buildPasswordField() {
    return inputField(hintText: "Parola");
  }
}
