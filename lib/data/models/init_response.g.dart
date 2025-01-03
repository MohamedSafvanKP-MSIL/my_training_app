// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitResponse _$InitResponseFromJson(Map<String, dynamic> json) => InitResponse(
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => TrainingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainings: (json['trainings'] as List<dynamic>)
          .map((e) => TrainingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InitResponseToJson(InitResponse instance) =>
    <String, dynamic>{
      'highlights': instance.highlights,
      'trainings': instance.trainings,
    };

TrainingItem _$TrainingItemFromJson(Map<String, dynamic> json) => TrainingItem(
      id: json['id'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      avenue: json['avenue'] as String,
      location: json['location'] as String,
      badgeTitle: json['badgeTitle'] as String?,
      trainingName: json['trainingName'] as String,
      traineeName: json['traineeName'] as String,
      traineeFee: (json['traineeFee'] as num).toDouble(),
      offerPrice: (json['offerPrice'] as num).toDouble(),
      imageURL: json['imageURL'] as String,
    );

Map<String, dynamic> _$TrainingItemToJson(TrainingItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'avenue': instance.avenue,
      'location': instance.location,
      'badgeTitle': instance.badgeTitle,
      'trainingName': instance.trainingName,
      'traineeName': instance.traineeName,
      'traineeFee': instance.traineeFee,
      'offerPrice': instance.offerPrice,
      'imageURL': instance.imageURL,
    };
