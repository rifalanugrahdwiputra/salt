import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.controller,
    this.isLoading,
    required this.color,
  }) : super(key: key);
  final String? text;
  final void Function()? press;
  final bool? isLoading;
  final dynamic controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? Obx(() => SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: color,
                ),
                onPressed: isLoading == true ? null : press,
                child: controller != null
                    ? controller.isLoading.value
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white))
                        : Text(
                            text!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.bgColor,
                              fontFamily: 'Quicksand',
                            ),
                          )
                    : Text(
                        text!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.bgColor,
                          fontFamily: 'Quicksand',
                        ),
                      ),
              ),
            ))
        : SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: isLoading == true ? null : press,
              child: Text(
                text!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bgColor,
                  fontFamily: 'Quicksand',
                ),
              ),
            ),
          );
  }
}
