import 'package:json_annotation/json_annotation.dart';

part 'init_response.g.dart';

@JsonSerializable()
class InitResponse {
  final List<TrainingItem> highlights;
  final List<TrainingItem> trainings;

  InitResponse({
    required this.highlights,
    required this.trainings,
  });

  factory InitResponse.fromJson(Map<String, dynamic> json) =>
      _$InitResponseFromJson(json['data']);

  Map<String, dynamic> toJson() => _$InitResponseToJson(this);
}

@JsonSerializable()
class TrainingItem {
  final String id;
  final String date;
  final String time;
  final String avenue;
  final String location;
  final String? badgeTitle; // Optional field
  final String trainingName;
  final String traineeName;
  final double traineeFee;
  final double offerPrice;
  final String imageURL;

  TrainingItem({
    required this.id,
    required this.date,
    required this.time,
    required this.avenue,
    required this.location,
    this.badgeTitle,
    required this.trainingName,
    required this.traineeName,
    required this.traineeFee,
    required this.offerPrice,
    required this.imageURL,
  });

  factory TrainingItem.fromJson(Map<String, dynamic> json) =>
      _$TrainingItemFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingItemToJson(this);
}
