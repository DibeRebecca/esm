import 'package:esm/controllers/otp_controller.dart';
import 'package:esm/controllers/signup_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
Get.put(OTPController());
  Get.put(SignUpController());
}