import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/transfer/task.dart';
import 'package:logging/logging.dart';

import '../transfer/photo.dart';
const String baseUrl = 'http://10.0.2.2:8080';/*'https://desilets-kickmyb-server.onrender.com'*/


class SingletonDio {
  static var cookiemanager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }
}

//#region Comptes
Future<SigninResponse> signup(SignupRequest req) async
{
  try {
    var response = await SingletonDio.getDio().post('$baseUrl/api/id/signup',
        data: req,
        options: Options(contentType: Headers.jsonContentType));

    /*Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        print('${record.level.name}: ${record.time}: ${record.message} test');
      }
    });*/
    if (kDebugMode) {
      print(response);
    }
    return SigninResponse.fromJson(response.data);
  }
  catch (e){
    if (kDebugMode) {
      print(e);
    }
    rethrow;
  }
}

Future<SigninResponse> signin(SigninRequest req) async
{
  try {
    var response = await SingletonDio.getDio().post('$baseUrl/api/id/signin',
        data: req,
        options: Options(contentType: Headers.jsonContentType));
    print(response);
    return SigninResponse.fromJson(response.data);
  }
  catch (e){
    print(e);
    rethrow;
  }
}

Future<String> signout() async
{
  try {
    var response = await SingletonDio.getDio().post('$baseUrl/api/id/signout',
        options: Options(contentType: Headers.jsonContentType));
    print(response);
    return response.toString();
  }
  catch (e){
    print(e);
    rethrow;
  }
}
//#endregion

//#region Tâches
Future<List<HomeItemResponse>> home() async {
  try {
    var response = await SingletonDio.getDio().get('$baseUrl/api/home');
    print(response);
    var listeJSON = response.data as List;
    var listeTasks = listeJSON.map((elementJSON) {
      return HomeItemResponse.fromJson(elementJSON);
    }).toList();
    return listeTasks;
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<String> addTask(AddTaskRequest request) async
{
  try{
    var response = await SingletonDio.getDio().post('$baseUrl/api/add',
    data: request,
    options: Options(contentType: Headers.jsonContentType));
    print(response);
    return response.toString();
  }
  catch(e){
    print(e);
    rethrow;
  }
}

Future<String> editTask(ProgressEvent request, int id) async
{
  try{
    var response = await SingletonDio.getDio().get('$baseUrl/api/progress/${id}/${request.value}',
        data: request,
        options: Options(contentType: Headers.jsonContentType));
      print(response);
    return response.toString();
  }
  catch(e){
    print(e);
    rethrow;
  }
}
//#endregion
//region photos
Future<List<HomeItemPhotoResponse>> homePhoto() async {
  try {
    var response = await SingletonDio.getDio().get('$baseUrl/api/home/photo');
    print(response);
    var listeJSON = response.data as List;
    var listeTasksPhotos = listeJSON.map((elementJSON) {
      return HomeItemPhotoResponse.fromJson(elementJSON);
    }).toList();
    return listeTasksPhotos;
  } catch (e) {
    print(e);
    rethrow;
  }
}
Future<TaskDetailPhotoResponse> detailTaskPhoto(int taskId) async {
  try {
    var response = await SingletonDio.getDio().get('$baseUrl/file/${taskId}');
    print(response);
    var JSON = response.data;
    var TaskPhoto = JSON.map((elementJSON) {
      return HomeItemResponse.fromJson(elementJSON);
    }).toList();
    return TaskPhoto;
  } catch (e) {
    print(e);
    rethrow;
  }
}
  Future<String> postPhoto(int taskId, MultipartFile file) async {
    try{
      var response = await SingletonDio.getDio().get('$baseUrl/file');
      print(response);
      return response.toString();
    }
    catch (e) {
      print(e);
      rethrow;
    }
  }
