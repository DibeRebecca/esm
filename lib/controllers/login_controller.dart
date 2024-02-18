import 'package:get/get.dart';

import '../repository/auth_repository/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  RxBool loading = false.obs;

  void loginUser(String phone){
    String? error=AuthenticationRepository.instance.loginWithEmailAndPassword(phone, "") as String?;
    if(error!=null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }


}
