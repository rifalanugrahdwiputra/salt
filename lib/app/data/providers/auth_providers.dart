import 'dart:convert';
import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../models/auth_model.dart';

class AuthProviders {
  Dio dio = Dio();
  Response? response;
  String baseUrl = AppConfig.baseUrl;

  Future<AuthModel> postAuth({Map<String, dynamic>? dataRequest}) async {
    response = await dio.post(
      "${baseUrl}api/login",
      data: dataRequest,
    );
    return authModelFromJson(jsonEncode(response!.data));
  }
}
