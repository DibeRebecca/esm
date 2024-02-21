
import 'package:esm/repository/auth_repository/auth_repository.dart';
import 'package:esm/screens/home/home.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();
  //Get.put(OTPController());
  void verifyOTP(String otp) async{
    var isVerified=await AuthenticationRepository.instance.verifyOTP(otp);
   // isVerified ? Get.offAll(const HomeScreen()):Get.back();
  }
  
}