import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:tp1_desilets/transfer/account.dart';
import 'package:tp1_desilets/transfer/task.dart';

const String baseUrl = 'https://desilets-kickmyb-server.onrender.com';


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
    var response = await SingletonDio.getDio().post(baseUrl + '/api/id/signup',
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

Future<SigninResponse> signin(SigninRequest req) async
{
  try {
    var response = await SingletonDio.getDio().post(baseUrl + '/api/id/signin',
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
    var response = await SingletonDio.getDio().post(baseUrl + '/api/id/signout',
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
    var response = await SingletonDio.getDio().get('https://desilets-kickmyb-server.onrender.com/api/home');
    print(response);
    var listeJSON = response.data as List;
    var listeTasks = listeJSON.map((elementJSON) {
      return HomeItemResponse.fromJson(elementJSON);
    }).toList();
    return listeTasks;
  } catch (e) {
    print(e);
    throw (e);
  }
}

Future<String> addTask(AddTaskRequest request) async
{
  try{
    var response = await Dio().post(baseUrl + '/api/add',
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

Future<String> editTask(ProgressEvent request) async
{
  try{
    var response = await SingletonDio.getDio().post(baseUrl + '/api/progress/{taskID}/{value}',
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
