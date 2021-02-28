import 'package:wirebo/utils/constants.dart';
import 'package:wirebo/http/base_http.dart';
import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

Future<String> login(String email, String password) async {
  try {
    HttpResponse response = await doPost(
        <String, String>{'email': email, 'password': password}, 'auth/login');

    if (!response.ok) {
      return response.payload['message'];
    }

    await keyValueStore.write("authToken", response.payload['token']);

    return okMessage;
  } catch (e) {
    return genericErrMessage;
  }
}

Future<String> register(Map<String, String> payload) async {
  try {
    HttpResponse response = await doPost(payload, 'auth/register');

    if (!response.ok) {
      return response.payload['message'];
    }

    return okMessage;
  } catch (e) {
    return genericErrMessage;
  }
}

Future<String> getId() async {
  try {
    HttpResponse response = await doGet('p/rooms');

    return response.payload;
  } catch (e) {
    return e.toString();
  }
}
