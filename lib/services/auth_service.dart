import 'package:wirebo/utils/constants.dart';
import 'package:wirebo/http/base_http.dart' as baseHttp;
import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

Future<String> login(String email, String password) async {
  try {
    baseHttp.HttpResponse response = await baseHttp.doPost(
        <String, String>{'email': email, 'password': password}, 'login');

    if (!response.ok) {
      return response.payload['message'];
    }

    await keyValueStore.write("authToken", response.payload['token']);

    return loginSuccessful;
  } catch (e) {
    return genericErrMessage;
  }
}
