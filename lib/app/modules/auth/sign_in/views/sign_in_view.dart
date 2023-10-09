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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/login.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 130.0,
                  ),
                  const SizedBox(height: 30.0),
                  Card(
                    elevation: 5,
                    color: AppColors.whiteColor,
                    shadowColor: AppColors.shadowColor.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Obx(
                        () => Form(
                          key: controller.key,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Text(
                                "Login".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: controller.usernameController,
                                keyboardType: TextInputType.text,
                                validator: controller.validateUsername,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyColor.withOpacity(0.8),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Masukan Username',
                                  hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greyColor.withOpacity(0.6),
                                    fontFamily: 'Quicksand',
                                  ),
                                  filled: true,
                                  fillColor: AppColors.inputColor,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Radius 5px
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Radius 5px
                                    borderSide: const BorderSide(
                                      width: 2.0,
                                      color: AppColors.primaryColor,
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
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyColor.withOpacity(0.8),
                                ),
                                decoration: InputDecoration(
                                  hintText: "Masukan Password",
                                  hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greyColor.withOpacity(0.6),
                                    fontFamily: 'Quicksand',
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller.obscureTextInput.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: () => controller.secureText(),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.inputColor,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Radius 5px
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Radius 5px
                                    borderSide: const BorderSide(
                                      width: 2.0,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              PrimaryButton(
                                color: AppColors.secondaryColor,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
