import 'params_model.dart';

class StageModel {
  final String id; 
  final String name; 
  final List<StageParameterSettingModel> params; 

  StageModel({
    required this.id,
    required this.name,
    required this.params,
  });

  factory StageModel.fromJson(String id, Map<String, dynamic> json, Map<String, dynamic> nameData) {
    String stageName = nameData[id]?['name'];

    List<StageParameterSettingModel> parameters = [];
    if (json['params'] != null) {
      json['params'].forEach((paramId, paramDetails) {
        parameters.add(StageParameterSettingModel.fromJson(paramId, paramDetails, nameData));
      });
    }

    return StageModel(
      id: id,
      name: stageName,
      params: parameters,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'params': params.map((param) => param.toJson()).toList(),
    };
  }
}
