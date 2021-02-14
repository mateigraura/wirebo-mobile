import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

final readSkKey = 'sk';
final okMsg = 'ok';

Future<String> getPrivateKey() async {
  return await keyValueStore.read(readSkKey);
}

Future writePrivateKey(String sk) async {
  await keyValueStore.write('sk', sk);
}

Future<String> getRoomSecret(String id) async {
  return await keyValueStore.read(id);
}

Future writeRoomSecret(String id, String secret) async {
  await keyValueStore.write(id, secret);
}

Future<String> readIsKeyPairSetup() async {
  return await keyValueStore.read('kp');
}

Future writeIsKeyPairSetup() async {
  await keyValueStore.write('kp', okMsg);
}

Future<String> readShouldRetry() async {
  return await keyValueStore.read('kpretry');
}

Future writeShouldRetry() async {
  await keyValueStore.write('kpretry', okMsg);
}
