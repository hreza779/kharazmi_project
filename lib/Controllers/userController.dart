import 'package:get/get.dart';

class UserController extends GetxController {
  login(var user, var pass) {
    if (user == "ghadir") {
      if (pass == "123") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
