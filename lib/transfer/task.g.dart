// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest(
      json['name'] as String,
      DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deadline': instance.deadline.toIso8601String(),
    };

ProgressEvent _$ProgressEventFromJson(Map<String, dynamic> json) =>
    ProgressEvent(
      (json['value'] as num).toInt(),
      DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ProgressEventToJson(ProgressEvent instance) =>
    <String, dynamic>{
      'value': instance.value,
      'timestamp': instance.timestamp.toIso8601String(),
    };

HomeItemResponse _$HomeItemResponseFromJson(Map<String, dynamic> json) =>
    HomeItemResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['percentageDone'] as num).toInt(),
      (json['percentageTimeSpent'] as num).toDouble(),
      DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$HomeItemResponseToJson(HomeItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'name': instance.name,
    };
