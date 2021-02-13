import 'package:wirebo/storage/keyvalue_store.dart' as keyValueStore;

Future<String> getPrivateKey() async {
  return await keyValueStore.read('sk');
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
