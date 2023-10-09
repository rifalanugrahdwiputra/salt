import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class InfoMessageSuccessHelper {
  static void showMessage(String? message) => Fluttertoast.showToast(
        msg: message!,
        textColor: AppColors.textSuccessColor,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.TOP_LEFT,
        backgroundColor: AppColors.alertSuccessColor.withOpacity(0.5),
      );
}

class InfoMessageErrorHelper {
  static void showMessage(String? message) => Fluttertoast.showToast(
        msg: message!,
        textColor: AppColors.textErrorColor,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.TOP_LEFT,
        backgroundColor: AppColors.alertErrorColor,
      );
}
