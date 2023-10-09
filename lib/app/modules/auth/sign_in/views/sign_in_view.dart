import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

import '../../../../widgets/primary_button.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Obx(
              () => Form(
                key: controller.key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const Text(
                      "Silahkan masukan email dan password anda disini",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: controller.usernameController,
                      keyboardType: TextInputType.text,
                      validator: controller.validateUsername,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Masukan Username',
                        hintStyle: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                          fontFamily: 'Quicksand',
                        ),
                        filled: true,
                        fillColor: AppColors.cardColor,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: AppColors.whiteColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscureTextInput.value,
                      validator: controller.validatePassword,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        hoverColor: AppColors.primaryColor,
                        hintText: "Masukan Password",
                        hintStyle: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                          fontFamily: 'Quicksand',
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(controller.obscureTextInput.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () => controller.secureText(),
                        ),
                        suffixIconColor: AppColors.whiteColor,
                        filled: true,
                        fillColor: AppColors.cardColor,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: AppColors.whiteColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    PrimaryButton(
                      color: AppColors.cardColor,
                      text: "LOGIN",
                      isLoading: controller.isLoading.value,
                      controller: Get.put(SignInController()),
                      press: () => controller.login(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
