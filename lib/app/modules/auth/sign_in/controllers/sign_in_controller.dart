import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/models/auth_model.dart';
import '../../../../data/providers/auth_providers.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/local_storage.dart';
import '../../../../utils/message.dart';

class SignInController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var authProviders = AuthProviders();
  GetStorage box = GetStorage();

  RxBool obscureTextInput = true.obs;
  RxBool isLoading = false.obs;
  RxBool rememberMe = true.obs;

  void login() async {
    final dataRequest = {
      "email": "eve.holt@reqres.in",
      "password": "cityslicka"
    };
    // {
    //   "username": usernameController.text,
    //   "password": passwordController.text,
    // };

    try {
      isLoading.toggle();
      AuthModel response =
          await authProviders.postAuth(dataRequest: dataRequest);
      if (response.token!.isNotEmpty) {
        box.write(LocalStorage.isSignIn, true);
        box.write(LocalStorage.tokenJWT, response.token);
        Get.offAllNamed(Routes.home);
      } else {
        InfoMessageErrorHelper.showMessage(
            "Username atau password anda salah!");
      }
    } on DioError catch (error) {
      InfoMessageErrorHelper.showMessage(error.message);
    } finally {
      isLoading.toggle();
    }
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Username harus di isi";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length <= 4) {
      return "Password harus di isi";
    } else {
      return null;
    }
  }

  void secureText() {
    obscureTextInput.toggle();
  }
}
