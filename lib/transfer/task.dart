 import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

 @JsonSerializable()
class AddTaskRequest
 {
   AddTaskRequest(this.name, this.deadline);
   String name;
   DateTime deadline;

   factory AddTaskRequest.fromJson(Map<String, dynamic> json) => _$AddTaskRequestFromJson(json);
   Map<String, dynamic> toJson() => _$AddTaskRequestToJson(this);
 }

 @JsonSerializable()
 class ProgressEvent
 {
   ProgressEvent(this.value, this.timestamp);
   int value;
   DateTime timestamp;

   factory ProgressEvent.fromJson(Map<String, dynamic> json) => _$ProgressEventFromJson(json);
   Map<String, dynamic> toJson() => _$ProgressEventToJson(this);
 }

@JsonSerializable()
class HomeItemResponse
{
  HomeItemResponse (this.id, this.name, this.percentageDone, this.percentageTimeSpent,/*this.creationDate,*/ this.deadline);
  int id;
  //DateTime creationDate;
  DateTime deadline;
  int percentageDone;
  double percentageTimeSpent;
  String name;

  factory HomeItemResponse.fromJson(Map<String, dynamic> json) => _$HomeItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemResponseToJson(this);
}