class Form {
  String formName;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? birthday;
  String? gender;
  String? identityId;
  String? country;
  String? city;
  String? district;
  String? postCode;
  String? address;
  String? password;

  Form({
    required this.formName,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phoneNumber,
    this.birthday,
    this.gender,
    this.identityId,
    this.country,
    this.city,
    this.district,
    this.postCode,
    this.address,
    this.password,
  });

  factory Form.fromJson(Map<String, dynamic> json) => Form(
        formName: json['form_name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        birthday: json['birthday'],
        gender: json['gender'],
        identityId: json['identity_id'],
        country: json['country'],
        city: json['city'],
        district: json['district'],
        postCode: json['post_code'],
        address: json['address'],
        password: json['password'],
      );

  Map<String, Object?> toJson() => {
        "form_name": formName,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "identity_id": identityId,
        "country": country,
        "city": city,
        "district": district,
        "post_code": postCode,
        "address": address,
        "password": password
      };

  String? get fullName {
    if (firstName == null || lastName == null) {
      return null;
    }
    return "$firstName $lastName";
  }

  String? get loc {
    if (country == null ||
        city == null ||
        district == null ||
        postCode == null ||
        address == null) {
      return null;
    }
    return "$country, $city, $district $postCode\n$address";
  }

  List<String?> get structure => [
        fullName,
        username,
        email,
        phoneNumber,
        birthday,
        gender,
        identityId,
        loc,
      ];
}
