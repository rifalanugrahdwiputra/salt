import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:salt/app/data/models/users_model.dart';
import '../../config/app_config.dart';
import '../../middleware/app_auth_token_middleware.dart';

class UsersProviders {
  Dio dio = Dio();
  Response? response;
  String baseUrl = AppConfig.baseUrl;

  Future<UsersModel> getUsers() async {
    response = await dio.get(
      "${baseUrl}api/users?page=2",
      options: Options(
        headers: AppAuthMiddleware.setHeaderHttpRequestJson(),
      ),
    );
    return usersModelFromJson(jsonEncode(response!.data));
  }
}
