class LoginUserDto {
  String username;
  String password;
  bool isBiometricLogin;

  LoginUserDto({
    required this.username,
    required this.password,
    required this.isBiometricLogin,
  });

  factory LoginUserDto.fromJson(Map<String, dynamic> json) => LoginUserDto(
        username: json["username"],
        password: json["password"],
        isBiometricLogin: json["isBiometricLogin"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "isBiometricLogin": isBiometricLogin,
      };
}
