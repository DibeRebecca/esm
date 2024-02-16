import 'package:esm/repository/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  //final email = TextEditingController();

  void registerUser(String email, String password){
    String? error=AuthenticationRepository.instance.createUserWithEmailAndPassword(email,password) as String?;
    if(error!=null) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
  
}