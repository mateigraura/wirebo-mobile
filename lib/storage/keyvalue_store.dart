import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> read(String key) async {
  final storage = new FlutterSecureStorage();

  String value = await storage.read(key: key);

  return value;
}

Future write(String key, String value) async {
  final storage = new FlutterSecureStorage();

  await storage.write(key: key, value: value);
}
