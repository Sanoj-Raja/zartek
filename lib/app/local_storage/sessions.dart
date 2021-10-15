import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Rx<String> USER_TOKEN = ''.obs;
Rx<String> USER_NAME = ''.obs;
Rx<String> USER_IMAGE = ''.obs;

class SessionManager {
  static final userStorage = GetStorage();
  static final String userToken = 'User Token';
  static final String userName = 'User Name';
  static final String userImage = 'User Image';

  static Future<void> saveUserToken(String token) async {
    USER_TOKEN.value = token;
    userStorage.write(userToken, token);
    print("User Token Saved ==> $token.");
  }

  static Future<String> getUserToken() async {
    String token = await userStorage.read(userToken) ?? '';
    USER_TOKEN.value = token;
    print("User Token ==> $token.");
    return token;
  }

  static Future<void> saveUserName(String name) async {
    USER_NAME.value = name;
    userStorage.write(userName, name);
    print("User Name Saved ==> $name.");
  }

  static Future<String> getUserName() async {
    String name = await userStorage.read(userName) ?? '';
    USER_NAME.value = name;
    print("User Name ==> $name.");
    return name;
  }

  static Future<void> saveUserImage(String image) async {
    USER_IMAGE.value = image;
    userStorage.write(userImage, image);
    print("User Image Saved ==> $image.");
  }

  static Future<String> getUserImage() async {
    String image = await userStorage.read(userImage) ?? '';
    USER_IMAGE.value = image;
    print("User Image ==> $image.");
    return image;
  }

  static void clearSession() {
    userStorage.erase();
    print("Session Cleared.");
  }
}
