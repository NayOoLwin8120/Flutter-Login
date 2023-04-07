import 'package:dio/dio.dart';
import 'package:userlogin/Views/api/apiendpoint.dart';

class RestApi{
  static const String _baseUrl="https://google.com";
  static final _options=BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout:const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    headers:{
      "Content-type":"application/json",
    }

  );
  static final _dio=Dio(_options);

  static  getData({String? base,
  String? endpoint,
  String? authkey}) async {

    try  {
      var response = await Dio()
          .get('${base}${endpoint != null ? "$endpoint" : ""}');
      // print(response.data);
      // print(response.statusCode);
      return response;
      // print(response);
    } catch (e) {
      print(e);
    }
  }


  static void get ({
    String? baseUrl,
    String? query,
    String? authKey,
  }){
    if(baseUrl != null){
      _dio.options.baseUrl=baseUrl;
    }
    if(authKey != null){
      _dio.options.headers={"Authorization":"Bearer $authKey"};
    }


  }
  static void post(){

  }
}