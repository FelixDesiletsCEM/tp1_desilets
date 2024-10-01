// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest()
      ..name = json['name'] as String
      ..deadline = DateTime.parse(json['deadline'] as String);

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'deadline': instance.deadline.toIso8601String(),
    };

ProgressEvent _$ProgressEventFromJson(Map<String, dynamic> json) =>
    ProgressEvent()
      ..value = (json['value'] as num).toInt()
      ..timestamp = DateTime.parse(json['timestamp'] as String);

Map<String, dynamic> _$ProgressEventToJson(ProgressEvent instance) =>
    <String, dynamic>{
      'value': instance.value,
      'timestamp': instance.timestamp.toIso8601String(),
    };

HomeItemResponse _$HomeItemResponseFromJson(Map<String, dynamic> json) =>
    HomeItemResponse()
      ..id = (json['id'] as num).toInt()
      ..creationDate = DateTime.parse(json['creationDate'] as String)
      ..deadline = DateTime.parse(json['deadline'] as String)
      ..percentageDone = (json['percentageDone'] as num).toInt()
      ..percentageTimeSpent = (json['percentageTimeSpent'] as num).toDouble()
      ..name = json['name'] as String;

Map<String, dynamic> _$HomeItemResponseToJson(HomeItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'percentageDone': instance.percentageDone,
      'percentageTimeSpent': instance.percentageTimeSpent,
      'name': instance.name,
    };
