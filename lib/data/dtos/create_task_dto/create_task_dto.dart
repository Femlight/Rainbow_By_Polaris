class CreateTaskRequestDto {
 final String? name;
 final String? description;
 final bool? isTaskReccuring;
 final String? dueDate;
 final String? rewardType;
 final String? frequency;
 final String? parentAccountId;
 final int? amount;
  final int? point;
 final List<String>? assignTo;

  CreateTaskRequestDto({
     this.name,
     this.description,
     this.isTaskReccuring,
     this.dueDate,
     this.rewardType,
     this.frequency,
     this.parentAccountId,
     this.amount,
     this.point,
     this.assignTo,
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
    assignTo:json["assignTo"] == null ? [] : List<String>.from(json["assignTO"]!.map((e) => e)),
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
