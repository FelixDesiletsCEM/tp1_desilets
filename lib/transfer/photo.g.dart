// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeItemPhotoResponse _$HomeItemPhotoResponseFromJson(
        Map<String, dynamic> json) =>
    HomeItemPhotoResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['percentageDone'] as num).toInt(),
      (json['percentageTimeSpent'] as num).toDouble(),
      DateTime.parse(json['deadline'] as String),
      (json['photoId'] as num).toInt(),
    );

Map<String, dynamic> _$HomeItemPhotoResponseToJson(
        HomeItemPhotoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'name': instance.name,
      'photoId': instance.photoId,
    };

TaskDetailPhotoResponse _$TaskDetailPhotoResponseFromJson(
        Map<String, dynamic> json) =>
    TaskDetailPhotoResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['percentageDone'] as num).toInt(),
      (json['percentageTimeSpent'] as num).toDouble(),
      DateTime.parse(json['deadline'] as String),
      (json['photoId'] as num).toInt(),
    );

Map<String, dynamic> _$TaskDetailPhotoResponseToJson(
        TaskDetailPhotoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'name': instance.name,
      'photoId': instance.photoId,
    };
