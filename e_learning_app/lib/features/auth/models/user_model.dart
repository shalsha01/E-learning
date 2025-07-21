class UserModel {
  final String token;
  final String email;
  final String name;

  UserModel({required this.token, required this.email, required this.name});

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
        'name': name,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json['token'],
        email: json['email'],
        name: json['name'],
      );
}
