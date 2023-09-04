class LoginUserResponseModelDto {
    Value? value;
    bool? isSuccess;
    String? error;
    dynamic message;
    dynamic responseCode;

    LoginUserResponseModelDto({
         this.value,
         this.isSuccess,
         this.error,
        this.message,
        this.responseCode,
    });

    factory LoginUserResponseModelDto.fromJson(Map<String, dynamic> json) => LoginUserResponseModelDto(
        value: Value.fromJson(json["value"]),
        isSuccess: json["isSuccess"],
        error: json["error"],
        message: json["message"],
        responseCode: json["responseCode"],
    );

    Map<String, dynamic> toJson() => {
        "value": value?.toJson(),
        "isSuccess": isSuccess,
        "error": error,
        "message": message,
        "responseCode": responseCode,
    };
}

class Value {
    dynamic message;
    String? accessToken;
    int? expiresIn;
    String? tokenType;
    String? refreshToken;
    String? scope;
    bool? twoFactorEnabled;
    bool? isFirstLogin;

    Value({
        this.message,
        this.accessToken,
        this.expiresIn,
        this.tokenType,
        this.refreshToken,
        this.scope,
        this.twoFactorEnabled,
        this.isFirstLogin,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        message: json["message"],
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        tokenType: json["tokenType"],
        refreshToken: json["refreshToken"],
        scope: json["scope"],
        twoFactorEnabled: json["twoFactorEnabled"],
        isFirstLogin: json["isFirstLogin"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "tokenType": tokenType,
        "refreshToken": refreshToken,
        "scope": scope,
        "twoFactorEnabled": twoFactorEnabled,
        "isFirstLogin": isFirstLogin,
    };
}