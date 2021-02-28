import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;
import 'package:global_configuration/global_configuration.dart';

final httpOkStatus = 200;
final httpUnauthorizedStatus = 401;

String apiUrl() => GlobalConfiguration().getValue('apiUrl');

class HttpResponse {
  bool ok;
  dynamic payload;

  HttpResponse({this.ok, this.payload});
}

enum RequestType { Get, Post }

Future<HttpResponse> doGet(String endpoint) async {
  try {
    final url = '${apiUrl()}/$endpoint';
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);

    final payload = jsonDecode(response.body);

    if (response.statusCode == httpOkStatus) {
      return new HttpResponse(ok: true, payload: payload);
    }
    if (response.statusCode == httpUnauthorizedStatus) {
      return await _retryRequest(url, RequestType.Get);
    }

    return new HttpResponse(ok: false, payload: payload);
  } catch (e) {
    throw e;
  }
}

Future<HttpResponse> doPost(dynamic body, String endpoint) async {
  try {
    final url = '${apiUrl()}/$endpoint';
    final encodedBody = jsonEncode(body);
    final headers = await _getHeaders();

    final response = await http.post(url, headers: headers, body: encodedBody);

    final payload = jsonDecode(response.body);

    if (response.statusCode == httpOkStatus) {
      return new HttpResponse(ok: true, payload: payload);
    }

    if (response.statusCode == httpUnauthorizedStatus) {
      return await _retryRequest(url, RequestType.Post, body: encodedBody);
    }

    return new HttpResponse(ok: false, payload: payload);
  } catch (e) {
    throw e;
  }
}

Future<HttpResponse> _retryRequest(String url, type, {dynamic body}) async {
  try {
    final token = await _refreshToken();
    final headers = await _getHeaders(token);

    dynamic response;
    if (type == RequestType.Get) {
      response = await http.get(url, headers: headers);
    }

    if (type == RequestType.Post) {
      response = await http.post(url, headers: headers, body: body);
    }

    final payload = jsonDecode(response.body);

    if (response.statusCode == httpOkStatus) {
      return new HttpResponse(ok: true, payload: payload);
    }

    return new HttpResponse(ok: false, payload: payload);
  } catch (e) {
    throw e;
  }
}

Future<String> _refreshToken() async {
  try {
    final url = '${apiUrl()}/auth/refresh';
    final headers = await _getHeaders();
    final expiredJwt = await keyValueStore.read('authToken');
    final encodedBody = jsonEncode(<String, String>{'token': expiredJwt});

    final response = await http.post(url, headers: headers, body: encodedBody);

    final payload = jsonDecode(response.body);

    if (response.statusCode == httpOkStatus) {
      final token = payload['token'];
      await keyValueStore.write('authToken', token);

      return token;
    }

    return '';
  } catch (e) {
    throw e;
  }
}

Future<Map<String, String>> _getHeaders([String token = '']) async {
  try {
    if (token.isEmpty) {
      token = await keyValueStore.read('authToken');
    }
  } catch (e) {
    token = '';
  }

  return <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token'
  };
}
