import 'package:dio/dio.dart';
import 'package:fake_store/Data/Network/endPoint.dart';

class DioHealper{
  static Dio? dio;
  static void init(){
    dio=Dio(
      BaseOptions(
        baseUrl: EndPoint.baseURL,
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> POST({required String endPoint,String? token,Map<String,dynamic>? body}) async{
    try {
      dio?.options.headers = {
        "Authorization": "Token token=\"$token\"",
      };
      Response? res = await dio?.post(endPoint,data: body);
      return res!;
    } catch (e) {
      rethrow;
    }
  }
  static Future<Response> get({required String endPoint,String? token,Map<String,dynamic>? body}) async{
    try {
      dio?.options.headers = {
        "Authorization": "Token token=\"$token\"",
      };
      Response? res = await dio?.get(endPoint,);
      return res!;
    } catch (e) {
      rethrow;
    }
  }
}

