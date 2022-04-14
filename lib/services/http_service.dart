import 'dart:convert';

import 'package:http/http.dart';

import '../model/post_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_LIST = "/api/v1/employee";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/21"; //{id}
  static String API_DELETE = "/api/v1/delete/2"; //{id}


  /* Http Request */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }



  /* Https Params */

  static Map<String, String>paramsEmpty(){
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post){
    Map<String, String> params = new Map();
    
    params.addAll({
      'name': post.name,
      'age' : post.age,
      'salary' :post.salary
    });

    return params;
  }

  static Map<String, String> paramsUpdate(Post post){
    Map<String, String> params = new Map();

    params.addAll({
      'salary' : post.salary,
      'name': post.name,
      'age' : post.age,
      'id' : post.id.toString()
    });

    return params;
  }

}
