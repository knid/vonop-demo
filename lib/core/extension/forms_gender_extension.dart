import '../../core/constants/enums/forms_gender_enum.dart';

extension GenderExtension on Gender {
  String get rawValue {
    switch (this) {
      case Gender.MALE:
        return "male";
      case Gender.FEMALE:
        return "female";
      case Gender.UNCERTAIN:
        return "uncertain";
      default:
        return "ERROR";
    }
  }
}
