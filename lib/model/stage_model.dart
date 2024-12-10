import 'params_model.dart';

class StageModel {
  final String name;
  final List<StageParameterSettingModel> params;
  final String id;

  StageModel({
    required this.name,
    required this.params,
    required this.id,
  });

  factory StageModel.fromJson(Map<String, dynamic> json) {
    List<StageParameterSettingModel> parameters = (json['params'] as List)
        .map((paramJson) => StageParameterSettingModel.fromJson(paramJson))
        .toList();

    return StageModel(
      name: json['name'],
      params: parameters,
      id: json['index'].toString(), 
    );
  }
}
