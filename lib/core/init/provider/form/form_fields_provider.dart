import 'package:flutter/material.dart';
import 'package:vonop/core/constants/app/app_constants.dart';
import 'package:vonop/view/ui/widgets/input_field.dart';

class FormFieldsProvider extends ChangeNotifier {
  FormFieldsProvider() {
    _structure['formName'] = formName;
  }
  Map<String, Widget?> _structure = {
    'formName': null,
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
  set structure(Map<String, Widget?> data) {
    _structure = data;
    notifyListeners();
  }

  Widget _buildFormNameField() {
    return InputField(
      labelText: "*Form İsmi",
      maxLength: 20,
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildNameAndLastNameField() {
    return Row(
      children: [
        Expanded(
          child: InputField(
            labelText: "İsim",
            enableFloatingLabelText: true,
            maxLength: 15,
            keyboardType: TextInputType.text,
            autoFillHints: const [AutofillHints.name],
            textEditingController: TextEditingController(),
          ),
        ),
        Expanded(
          child: InputField(
            labelText: "Soyisim",
            maxLength: 15,
            enableFloatingLabelText: true,
            keyboardType: TextInputType.text,
            textEditingController: TextEditingController(),
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return InputField(
      labelText: "Kullanıcı Adı",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildEmailField() {
    return InputField(
      labelText: "E-Mail",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
      validator: (val) {
        if (val != null) {
          if (!ApplicationConstants.EMAIL_REGEX.hasMatch(val)) {
            return "Lütfen Geçerli Bir Email Adresi Girin";
          }
        }
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return InputField(
      labelText: "Telefon Numarası",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildBirthdayField() {
    return InputField(
      labelText: "Doğum Günü",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildGenderField() {
    return InputField(
      labelText: "Cinsiyet",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildIdentityNoField() {
    return InputField(
      labelText: "Kimlik Numarası",
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildAddressField() {
    return InputField(
      labelText: "Adres",
      height: 80,
      maxLines: 3,
      maxLength: 200,
      enableFloatingLabelText: true,
      textEditingController: TextEditingController(),
    );
  }

  Widget _buildPasswordField() {
    return InputField(
      labelText: "Parola",
      enableFloatingLabelText: true,
      obscureText: true,
      autoFillHints: [AutofillHints.newPassword],
      textEditingController: TextEditingController(),
    );
  }
}
