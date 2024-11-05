import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';


@JsonSerializable()
class HomeItemPhotoResponse
{
  HomeItemPhotoResponse (this.id, this.name, this.percentageDone, this.percentageTimeSpent, this.deadline, this.photoId);
  int id;
  DateTime deadline;
  int percentageDone;
  double percentageTimeSpent;
  String name;
  int photoId;
  factory HomeItemPhotoResponse.fromJson(Map<String, dynamic> json) => _$HomeItemPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeItemPhotoResponseToJson(this);
}

@JsonSerializable()
class TaskDetailPhotoResponse
{
  TaskDetailPhotoResponse (this.id, this.name, this.percentageDone, this.percentageTimeSpent, this.deadline, this.photoId);
  int id;
  DateTime deadline;
  int percentageDone;
  double percentageTimeSpent;
  String name;
  int photoId;
  factory TaskDetailPhotoResponse.fromJson(Map<String, dynamic> json) => _$TaskDetailPhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDetailPhotoResponseToJson(this);}