import 'package:get/get.dart';
import '../../app/middleware/app_auth_sign_middleware.dart';
import '../modules/auth/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth/sign_in/views/sign_in_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AppAuthMiddleware()],
    ),
  ];
}
