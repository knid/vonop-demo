import 'package:flutter/material.dart';
import 'package:vonop/core/init/provider/form/form_fields_provider.dart';
import 'package:vonop/view/ui/widgets/platform_specific/action_sheet/sheet_action.dart';
import 'package:provider/provider.dart';
import '../../../../core/extension/map_extension.dart';

List<SheetAction> sheetActions(BuildContext context) {
  FormFieldsProvider formFieldsProvider = context.read<FormFieldsProvider>();
  return <SheetAction>[
    if (formFieldsProvider.structure['name'] == null)
      SheetAction(
        const Text('İsim Soyisim'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('name', formFieldsProvider.nameAndLastName);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['username'] == null)
      SheetAction(
        const Text('Kullanıcı Adı'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('username', formFieldsProvider.username);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['email'] == null)
      SheetAction(
        const Text('E-Mail'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('email', formFieldsProvider.email);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['phoneNumber'] == null)
      SheetAction(
        const Text('Telefon Numarası'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('phoneNumber', formFieldsProvider.phoneNumber);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['birthday'] == null)
      SheetAction(
        const Text('Doğum Tarihi'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('birthday', formFieldsProvider.birthday);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['gender'] == null)
      SheetAction(
        const Text('Cinsiyet'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('gender', formFieldsProvider.gender);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['identityNo'] == null)
      SheetAction(
        const Text('Kimlik Numarası'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('identityNo', formFieldsProvider.identityNo);
          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['address'] == null)
      SheetAction(
        const Text('Adres Bilgileri'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('address', formFieldsProvider.address);

          Navigator.pop(context);
        },
      ),
    if (formFieldsProvider.structure['password'] == null)
      SheetAction(
        const Text('Parola'),
        () {
          formFieldsProvider.structure = formFieldsProvider.structure.copyWith('password', formFieldsProvider.password);
          Navigator.pop(context);
        },
      ),
  ];
}
