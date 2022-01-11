import 'package:flutter/material.dart';
import 'package:vonop/core/constants/app/app_constants.dart';
import 'package:vonop/view/ui/widgets/input_field.dart';

class FormFieldsProvider extends ChangeNotifier {
  FormFieldsProvider() {
    for (var item in _structure.keys) {
      textEditingControllers[item] = TextEditingController();
    }
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

  Widget _buildFormNameField() {
    return InputField(
      labelText: "*Form İsmi",
      maxLength: 20,
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['form_name'],
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
            textEditingController: textEditingControllers['name'],
          ),
        ),
        Expanded(
          child: InputField(
            labelText: "Soyisim",
            maxLength: 15,
            enableFloatingLabelText: true,
            keyboardType: TextInputType.text,
            textEditingController: textEditingControllers['surname'],
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField() {
    return InputField(
      labelText: "Kullanıcı Adı",
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['username'],
    );
  }

  Widget _buildEmailField() {
    return InputField(
      labelText: "E-Mail",
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['email'],
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
      textEditingController: textEditingControllers['phone_number'],
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildBirthdayField() {
    return InputField(
      labelText: "Doğum Günü",
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['birthday'],
    );
  }

  Widget _buildGenderField() {
    return InputField(
      labelText: "Cinsiyet",
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['gender'],
    );
  }

  Widget _buildIdentityNoField() {
    return InputField(
      labelText: "Kimlik Numarası",
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['identity_id'],
    );
  }

  Widget _buildAddressField() {
    return InputField(
      labelText: "Adres",
      height: 80,
      maxLines: 3,
      maxLength: 200,
      enableFloatingLabelText: true,
      textEditingController: textEditingControllers['address'],
    );
  }

  Widget _buildPasswordField() {
    return InputField(
      labelText: "Parola",
      enableFloatingLabelText: true,
      obscureText: true,
      autoFillHints: [AutofillHints.newPassword],
      textEditingController: textEditingControllers['password'],
    );
  }
}
