class StageParameterSettingModel {
  final String name;
  final String value;
  final bool visibility;
  final String id;

  StageParameterSettingModel({
    required this.name,
    required this.value,
    required this.visibility,
    required this.id,
  });

  factory StageParameterSettingModel.fromJson(Map<String, dynamic> json) {
    bool visibility = true;

    if (json["state"] != null && json["state"]["reported"] != null) {
      visibility = json["state"]["reported"];
    }

    return StageParameterSettingModel(
      name: json['name'],
      visibility: visibility,
      value: json['value'],
      id: json['index'].toString(), 
    );
  }
}
