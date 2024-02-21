import 'package:esm/core/data/datasources/auth_remote_datasource.dart';
import 'package:esm/core/data/models/user_model.dart';
import 'package:esm/core/domain/entities/user_entity.dart';
import 'package:esm/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final name = TextEditingController();
  final phoneNo = TextEditingController();
  final _source = AuthRemoteDatasource();
  Rx<UserEntity?> currentUser = Rx(null);
  RxBool loading = RxBool(false);
  void register(
      {required String name,
      required String email,
      required String phone}) async {
    loading.value = true;
    final response =
        await _source.register(name: name, email: email, phone: phone);
    if (response.succes) {
      final user = UserModel.fromJson(response.data!);
      await refreshToken(response.token!);
      print(user);

      setCurrentUser(user).then((value) {
        loading.value = false;
        Get.to(const HomeScreen());
      });
      // Get.to(const HomeScreen());
    } else {
      loading.value = false;
      Get.showSnackbar(GetSnackBar(message: response.erreur ?? "erreur"));
    }
  }

  void login({required String email, required String phone}) async {
    loading.value = true;
    final response = await _source.login(email: email, phone: phone);
    if (response.succes) {
      final user = UserModel.fromJson(response.data!);
      print(response.token);
      await refreshToken(response.token!);
      await refreshUser(user);
      print(user);

      setCurrentUser(user).then((value) {
        loading.value = false;
        Get.to(const HomeScreen());
      });
      // Get.to(const HomeScreen());
    } else {
      loading.value = false;
      Get.showSnackbar(GetSnackBar(message: response.erreur ?? "erreur"));
    }
  }

  Future<void> setCurrentUser(UserEntity user) async {
    currentUser.value = user;
    await refreshUser(user);
  }

  Future<void> refreshToken(String token) async {
    final box = GetStorage();
    box.write('token', token);
  }
  Future<void> refreshUser(UserEntity user) async {
    final box = GetStorage();
    box.write('user', user);
  }

  String getToken() {
    final box = GetStorage();
    return box.read('token');
  }
  loadUser(){
    final box = GetStorage();
    final value =box.read("user");
    if(value!=null){
      currentUser.value=value as UserEntity;
    }


  }
}
