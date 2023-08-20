// To parse this JSON data, do
//
//     final uerProfileDto = uerProfileDtoFromJson(jsonString);

import 'dart:convert';

UserProfileDto uerProfileDtoFromJson(String str) => UserProfileDto.fromJson(json.decode(str));

String uerProfileDtoToJson(UserProfileDto data) => json.encode(data.toJson());

class UserProfileDto {
  final String? customerId;
  final dynamic userName;
  final dynamic userStatus;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final dynamic profilePicture;
  final Permission? rolePermission;
  final String? userRoleName;
  final String? userPermissions;
  final List<String>? roleList;
  final String? role;

  UserProfileDto({
    this.customerId,
    this.userName,
    this.userStatus,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profilePicture,
    this.rolePermission,
    this.userRoleName,
    this.userPermissions,
    this.roleList,
    this.role,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) => UserProfileDto(
    customerId: json["CustomerId"],
    userName: json["UserName"],
    userStatus: json["UserStatus"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    phoneNumber: json["PhoneNumber"],
    profilePicture: json["ProfilePicture"],
    rolePermission: json["RolePermission"] == null ? null : Permission.fromJson(json["RolePermission"]),
    userRoleName: json["UserRoleName"],
    userPermissions: json["UserPermissions"],
    roleList: json["RoleList"] == null ? [] : List<String>.from(json["RoleList"]!.map((x) => x)),
    role: json["Role"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerId": customerId,
    "UserName": userName,
    "UserStatus": userStatus,
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "PhoneNumber": phoneNumber,
    "ProfilePicture": profilePicture,
    "RolePermission": rolePermission?.toJson(),
    "UserRoleName": userRoleName,
    "UserPermissions": userPermissions,
    "RoleList": roleList == null ? [] : List<dynamic>.from(roleList!.map((x) => x)),
    "Role": role,
  };
}

class Permission {
  final String? id;
  final String? name;
  final dynamic description;
  final List<Permission>? permissions;
  final dynamic value;

  Permission({
    this.id,
    this.name,
    this.description,
    this.permissions,
    this.value,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
    id: json["Id"],
    name: json["Name"],
    description: json["Description"],
    permissions: json["Permissions"] == null ? [] : List<Permission>.from(json["Permissions"]!.map((x) => Permission.fromJson(x))),
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Description": description,
    "Permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toJson())),
    "Value": value,
  };
}
