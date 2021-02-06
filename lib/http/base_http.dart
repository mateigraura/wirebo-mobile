import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

final httpOkStatus = 200;
final httpUnauthorizedStatus = 401;

final apiUrl = FlutterConfig.get('API_URL');

class HttpResponse {
  bool ok;
  dynamic payload;

  HttpResponse({this.ok, this.payload});
}

Future<dynamic> doGet(String endpoint) async {
  final response = await http.get('$apiUrl/$endpoint');

  if (response.statusCode == httpOkStatus) {
    return jsonDecode(response.body);
  }
  if (response.statusCode == httpUnauthorizedStatus) {}

  throw Exception(jsonDecode(response.body));
}

Future<HttpResponse> doPost(dynamic body, String endpoint) async {
  try {
    final http.Response response = await http.post(
      '$apiUrl/$endpoint',
      headers: await _getHeaders(),
      body: jsonEncode(body),
    );
    final payload = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return new HttpResponse(ok: true, payload: payload);
    }

    return new HttpResponse(ok: false, payload: payload);
  } catch (e) {
    throw e;
  }
}

Future<Map<String, String>> _getHeaders() async {
  String token;
  try {
    token = await keyValueStore.read('authToken');
  } catch (e) {
    token = '';
  }

  return <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  };
}

T fromJson<T, K>(dynamic json) {
  return json;
}

T toJson<T, K>(dynamic object) {
  return object;
}
