import 'package:get/get_connect/http/src/response/response.dart';

abstract class BaseApiHelper {
  // Login, Signup & Logout.
  Future<Response> getFoods();
}
