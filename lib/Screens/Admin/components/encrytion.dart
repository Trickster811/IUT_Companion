import 'package:encrypt/encrypt.dart';

// for AES encryption algorithm
class EncryptionAES {
  static final keyAES = Key.fromLength(32);
  static final iv = IV.fromLength(16);
  static final encrypterAES = Encrypter(AES(keyAES, mode: AESMode.cbc, padding: null));

  static encryptAES(text) {
    final encrypted = encrypterAES.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }

  static decryptAES(text) {
    final decrypted = encrypterAES.decrypt(text, iv: iv);

    return decrypted;
  }
}

// for Fernet encryption algorithm
class EncryptionFernet {
  static final keyFernet = Key.fromUtf8(
      'IUT_CompanionD@ily_Le@rningIUT_CompanionD@ily_Le@rningIUT_CompanionD@ily_Le@rning');
  static final fernet = Fernet(keyFernet);
  static final encrypterFernet = Encrypter(fernet);

  static encryptFernet(text) {
    final encrypted = encrypterFernet.encrypt(text);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }

  static decryptFernet(text) {
    final decrypted = encrypterFernet.decrypt(text);

    return decrypted;
  }
}

// for Salsa20 encryption algorithm
class EncryptionSalsa20{
  static final keySalsa20 = Key.fromLength(32);
  static final iv = IV.fromLength(8);
  static final encrypterSalsa20 = Encrypter(Salsa20(keySalsa20));

  static encryptSalsa20(text) {
    final encrypted = encrypterSalsa20.encrypt(text, iv: iv);

    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);

    return encrypted;
  }

  static decryptSalsa20(text) {
    final decrypted = encrypterSalsa20.decrypt(text, iv: iv);

    return decrypted;
  }
}