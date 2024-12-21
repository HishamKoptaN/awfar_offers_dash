// تعريف UserCreateModel كما هو
class UserCreateModel {
  String role;
  String name;
  String username;
  String email;
  String password;
  String passwordConfirmation;

  UserCreateModel({
    required this.role,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory UserCreateModel.fromJson(Map<String, dynamic> json) =>
      UserCreateModel(
        role: json["role"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      };
}
