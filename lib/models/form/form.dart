class Form {
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

  factory Form.fromJson(Map<String, String?> json) => Form(
        firstName: json['firstName'],
        lastName: json['lastName'],
        username: json['username'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        birthday: json['birthday'],
        gender: json['gender'],
        identityId: json['identityId'],
        country: json['country'],
        city: json['city'],
        district: json['district'],
        postCode: json['postCode'],
        address: json['address'],
        password: json['password'],
      );

  Map<String, Object?> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "identityId": identityId,
        "country": country,
        "city": city,
        "district": district,
        "postCode": postCode,
        "address": address,
        "password": password
      };
}
