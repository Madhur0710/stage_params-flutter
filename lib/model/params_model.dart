import 'dart:convert';
import 'dart:io';

import 'package:stage_params/model/stage_data_model.dart';

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

  factory StageParameterSettingModel.fromJson(
      String id, Map<String, dynamic> json, Map<String, dynamic> nameData) {
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
