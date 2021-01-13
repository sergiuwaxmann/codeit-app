import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8('@SKWebDesign/SWaxmann/2020-2021!'); // ! 32 char
final iv = IV.fromUtf8('@SKWD/2020-2021!'); // ! 16 char

String encryptAES(String text) {
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final encrypted = encrypter.encrypt(text, iv: iv);
  return encrypted.base64;
}

String decryptAES(String encrypted) {
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypted = encrypter.decrypt(Encrypted.fromBase64(encrypted), iv: iv);
  return decrypted;
}
