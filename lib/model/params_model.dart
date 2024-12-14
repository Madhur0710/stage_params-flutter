import 'dart:convert';
import 'dart:io';

class StageParameterSettingModel {
  final String id;
  final double value;
  final bool visibility;
  final String name;

  StageParameterSettingModel({
    required this.id,
    required this.value,
    required this.visibility,
    required this.name,
  });

  factory StageParameterSettingModel.fromJson(String id, Map<String, dynamic> json, Map<String, dynamic> nameData) {
    String name = nameData[id]?['name'];

    return StageParameterSettingModel(
      id: id,
      value: json['val'],
      visibility: json['vis'] == 1,
      name: name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'visibility': visibility,
      'name': name,
    };
  }
}

void parseJson(Map<String, dynamic> json, Map<String, dynamic> nameData) {
  if (json["state"] != null && json["state"]["reported"] != null) {
    var reported = json["state"]["reported"];
    reported.forEach((key, value) {
      if (value["params"] != null) {
        var params = value["params"];
        params.forEach((id, paramDetails) {
          var model = StageParameterSettingModel.fromJson(id, paramDetails, nameData);
        });
      }
    });
  } else {
    print("Invalid JSON structure");
  }
}

Future<void> main() async {
  try {
    String dataFilePath = 'data/sample_stage_data.py'; 
    String nameFilePath = 'data/json_data.dart'; 

    String dataFileContent = await File(dataFilePath).readAsString();
    Map<String, dynamic> jsonData = jsonDecode(dataFileContent);

    String nameFileContent = await File(nameFilePath).readAsString();
    Map<String, dynamic> nameData = jsonDecode(nameFileContent);

  
    parseJson(jsonData, nameData);
  } catch (e) {
    print("Error reading or parsing the file: $e");
  }
}
