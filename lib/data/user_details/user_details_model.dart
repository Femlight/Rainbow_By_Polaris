class UserDetailsResponseModelDtoTexting {
  UserDto? value;
  bool? isSuccess;
  String? error;
  String? message;
  String? responseCode;

  UserDetailsResponseModelDtoTexting(
      {this.value,
      this.isSuccess,
      this.error,
      this.message,
      this.responseCode});

  UserDetailsResponseModelDtoTexting.fromJson(Map<String, dynamic> json) {
    value = json['value'] != null ? UserDto.fromJson(json['value']) : null;
    isSuccess = json['isSuccess'];
    error = json['error'];
    message = json['message'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['value'] = value!.toJson();
    }
    data['isSuccess'] = isSuccess;
    data['error'] = error;
    data['message'] = message;
    data['responseCode'] = responseCode;
    return data;
  }
}

class UserDto {
  String? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? status;
  String? customerType;
  String? phoneNumber;
  dynamic alias;
  List<ChildDetailsViewModel>? childDetailsViewModel;
  List<dynamic>? activityViewModel;

  UserDto(
      {this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.status,
      this.customerType,
      this.phoneNumber,
      this.alias,
      this.childDetailsViewModel,
      this.activityViewModel});

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    email = json['email'];
    status = json['status'];
    customerType = json['customerType'];
    phoneNumber = json['phoneNumber'];
    alias = json['alias'];
    if (json['childDetailsViewModel'] != null) {
      childDetailsViewModel = <ChildDetailsViewModel>[];
      json['childDetailsViewModel'].forEach((v) {
        childDetailsViewModel!.add(ChildDetailsViewModel.fromJson(v));
      });
    }
    // activityViewModel:
    json["activityViewModel"] == null
        ? []
        : List<dynamic>.from(json["activityViewModel"]!.map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['status'] = status;
    data['customerType'] = customerType;
    data['phoneNumber'] = phoneNumber;
    data['alias'] = alias;
    if (childDetailsViewModel != null) {
      data['childDetailsViewModel'] =
          childDetailsViewModel!.map((v) => v.toJson()).toList();
    }
    if (activityViewModel != null) {
      data['activityViewModel'] =
          activityViewModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildDetailsViewModel {
  String? accountNumber;
  String? firstName;
  String? middleName;
  String? lastName;
  String? alias;
  String? averta;
  String? status;
  String? profile;
  String? customerId;
  String? phoneNumber;
  String? accountId;
  String? parentAccountId;

  ChildDetailsViewModel(
      {this.accountNumber,
      this.firstName,
      this.middleName,
      this.lastName,
      this.alias,
      this.averta,
      this.status,
      this.profile,
      this.phoneNumber,
      this.customerId,
      this.accountId,
      this.parentAccountId});

  ChildDetailsViewModel.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    alias = json['alias'];
    averta = json['averta'];
    status = json['status'];
    profile = json['profile'];
    phoneNumber = json['phoneNumber'];
    customerId = json['customerId'];
    accountId = json['accountId'];
    parentAccountId = json['parentAccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['alias'] = alias;
    data['averta'] = averta;
    data['status'] = status;
    data['profile'] = profile;
    data['phoneNumber'] = phoneNumber;
    data['customerId'] = customerId;
    data['accountId'] = accountId;
    data['parentAccountId'] = parentAccountId;
    return data;
  }
}
