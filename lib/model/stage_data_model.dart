import 'stage_model.dart';

class StageDataModel {
  final String id;
  final StageModel stage;

  StageDataModel({
    required this.id,
    required this.stage,
  });

  factory StageDataModel.fromJson(Map<String, dynamic> json , Map<String, dynamic> nameData) {
    if (json.keys.length != 1) {
      throw ArgumentError('Expected JSON to contain exactly one stage, but got multiple.');
    }

    var stageId = json.keys.first;
    var stageData = json[stageId];

    if (stageData is! Map<String, dynamic>) {
      throw ArgumentError('Stage data must be a map, but got ${stageData.runtimeType}.');
    }

    return StageDataModel(
      id: stageId,
      stage: StageModel.fromJson(stageId, stageData, nameData), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      id: stage.toJson(), 
    };
  }
}
