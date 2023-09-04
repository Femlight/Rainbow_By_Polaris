class CreateTaskRequestDto {
  String name;
  String description;
  bool isTaskReccuring;
  String dueDate;
  String rewardType;
  String frequency;
  String parentAccountId;
  int amount;
  int point;
  String assignTo;

  CreateTaskRequestDto({
    required this.name,
    required this.description,
    required this.isTaskReccuring,
    required this.dueDate,
    required this.rewardType,
    required this.frequency,
    required this.parentAccountId,
    required this.amount,
    required this.point,
    required this.assignTo,
  });

  factory CreateTaskRequestDto.fromJson(Map<String, dynamic> json) => CreateTaskRequestDto(
    name: json["name"],
    description: json["description"],
    isTaskReccuring: json["isTaskReccuring"],
    dueDate: json["dueDate"],
    rewardType: json["rewardType"],
    frequency: json["frequency"],
    parentAccountId: json["parentAccountId"],
    amount: json["amount"],
    point: json["point"],
    assignTo:json["assignTo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "isTaskReccuring": isTaskReccuring,
    "dueDate": dueDate,
    "rewardType": rewardType,
    "frequency": frequency,
    "parentAccountId": parentAccountId,
    "amount": amount,
    "point": point,
    "assignTo": assignTo,
  };
}
