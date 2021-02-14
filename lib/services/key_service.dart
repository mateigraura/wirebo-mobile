import 'package:wirebo/crypto/ecdh.dart';
import 'package:wirebo/http/base_http.dart';
import 'package:wirebo/storage/key_storer.dart';

Future setupKeyPair() async {
  try {
    final kpSetup = await readIsKeyPairSetup();

    if (kpSetup == okMsg) {
      return true;
    }

    final kp = await generateKeyPair();

    await writePrivateKey(kp.privateKey.toBase64());

    final pkStored = await sendPublicKey(kp.publicKey.toBase64());
    if (!pkStored) {
      await writePrivateKey('null');
      await writeShouldRetry();
    }
  } catch (e) {
    throw e;
  }
}

Future<bool> sendPublicKey(String pk) async {
  try {
    HttpResponse response = await doPost({'publicKey': pk}, 'p/add-key');

    return response.ok;
  } catch (e) {
    return false;
  }
}
