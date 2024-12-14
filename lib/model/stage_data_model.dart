import 'stage_model.dart';

class StageDataModel {
  List<StageModel> stageModel;

  StageDataModel({
    required this.stageModel,
  });

  factory StageDataModel.fromJson(
      Map<String, dynamic> json, Map<String, dynamic> nameData) {
    List<StageModel> temp = [];

    if (json["state"] != null && json["state"]["reported"] != null) {
      var reported = json["state"]["reported"];
      reported.forEach((key, value) {
        temp.add(StageModel.fromJson(key, value, nameData));
      });
    } else {
      print("Invalid JSON structure");
    }
    return StageDataModel(stageModel: temp);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
