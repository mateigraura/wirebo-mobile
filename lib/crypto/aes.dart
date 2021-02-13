import 'dart:convert';
import 'package:cryptography/cryptography.dart';

final separator = ',';

Future<String> encrypt(String payload, SecretKey secret) async {
  final msg = utf8.encode(payload);

  final nonce = aesGcm.newNonce();
  final encrypted = await aesGcm.encrypt(msg, secretKey: secret, nonce: nonce);

  final messageEncoded = base64.encode(encrypted);
  final nonceEncoded = base64.encode(nonce.bytes);

  return '$nonceEncoded$separator$messageEncoded';
}

Future<String> decrypt(String payload, SecretKey secret) async {
  List<String> splitPayload = payload.split(separator);

  final msg = base64.decode(splitPayload[1]);

  final nonce = Nonce(base64.decode(splitPayload[0]));
  final decrypted = await aesGcm.decrypt(msg, secretKey: secret, nonce: nonce);

  return utf8.decode(decrypted);
}
