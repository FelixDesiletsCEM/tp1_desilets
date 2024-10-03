 import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

 @JsonSerializable()
class AddTaskRequest
 {
   AddTaskRequest();
   String name = '';
   DateTime deadline = DateTime(0, 0, 0, 0, 0, 0);

   factory AddTaskRequest.fromJson(Map<String, dynamic> json) => _$AddTaskRequestFromJson(json);
   Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
 }

 @JsonSerializable()
 class ProgressEvent
 {
   ProgressEvent();
   int value = 0;
   DateTime timestamp = DateTime(0, 0, 0, 0, 0, 0);

   factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);
   Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
 }

@JsonSerializable()
class HomeItemResponse
{
  HomeItemResponse ();
  int id = 0;
  DateTime creationDate = DateTime(0, 0, 0, 0, 0, 0);
  DateTime deadline = DateTime(0, 0, 0, 0, 0, 0);
  int percentageDone = 0;
  double percentageTimeSpent = 0;
  String name = '';

  factory HomeItemResponse .fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}