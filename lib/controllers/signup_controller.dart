import 'package:esm/repository/auth_repository/auth_repository.dart';
import 'package:esm/screens/auth/otp_verification.dart';
import 'package:esm/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  RxBool loading = false.obs;
  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  //final email = TextEditingController();
  var verificationId = ''.obs;
  Rx<User?>? currentUser;
  Rx<PhoneAuthCredential>? phoneCredential;

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  void phoneAuthentication(String phoneNo) async {
    updateLoading(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) {
          updateLoading(false);
          Get.to(const OTPVerificationScreen());
        },
        verificationFailed: (FirebaseAuthException e) {
          updateLoading(false);
          Get.showSnackbar(GetSnackBar(
            message: e.message.toString(),
            duration: const Duration(seconds: 3),
          ));
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } finally {
      updateLoading(false);
    }

  }

  void updateLoading(bool value) => loading.value = value;

  void verifyOTP(String otp) async {
    updateLoading(true);
    try {
      var credentials = await FirebaseAuth.instance.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otp));
      if (credentials.user != null) {
        currentUser?.value = credentials.user;
        Get.to(const HomeScreen());
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Erreur",
          duration: Duration(seconds: 3),
        ));
      }
      updateLoading(false);
    } catch (e) {
      updateLoading(false);
      Get.showSnackbar(const GetSnackBar(
        message: "Erreur",
        duration: Duration(seconds: 3),
      ));
    }

  }


}
