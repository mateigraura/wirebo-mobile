import 'dart:convert';
import 'package:cryptography/cryptography.dart';

Future<KeyPair> generateKeyPair() async {
  return await x25519.newKeyPair();
}

Future<SecretKey> generateSecret({PublicKey pk, PrivateKey sk}) async {
  return await x25519.sharedSecret(localPrivateKey: sk, remotePublicKey: pk);
}

extension PrivKeyExtension on PrivateKey {
  String toBase64() {
    return base64.encode(this.extractSync());
  }
}

extension PubKeyExtension on PublicKey {
  String toBase64() {
    return base64.encode(this.bytes);
  }
}

extension SecretExtension on SecretKey {
  String toBase64() {
    return base64.encode(this.extractSync());
  }
}
