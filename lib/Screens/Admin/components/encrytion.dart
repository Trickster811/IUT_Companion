import 'package:encrypt/encrypt.dart';

// for AES encryption algorithm
class EncrytionAES {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(16);
  static final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }

  static decryptAES(text) {
    final decrypted = encrypter.decrypt(text, iv:iv);

    return decrypted;
  }
}
