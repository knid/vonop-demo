class UserProfile {
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String profilePic;

  UserProfile({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phoneNumber: json['phone_number'] ?? "",
        profilePic: json['profile_pic'] ?? "",
      );
  Map<String, dynamic> toJson() => {
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'profile_pic': profilePic
      };
}
