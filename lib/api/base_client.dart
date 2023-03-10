import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "http://192.168.1.4:8080/attendanceRegistration";

class BaseClient {
  var client = http.Client();

  // GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  // POST Request
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };

    print(_payload.toString());
    print(url);
    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      print("OK");
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  // PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  // DELETE Request
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Content-Type': 'application/json ; charset=UTF-8',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}