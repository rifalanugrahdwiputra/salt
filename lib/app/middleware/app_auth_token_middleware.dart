import 'package:get_storage/get_storage.dart';
import '../utils/local_storage.dart';

class AppAuthMiddleware {
  GetStorage box = GetStorage();

  static Map<String, dynamic> setHeaderHttpRequest() {
    GetStorage box = GetStorage();

    Map<String, dynamic> headerHttpRequest = {
      'Authorization': 'Bearer ${box.read(LocalStorage.tokenJWT)}',
      'Content-Type': 'multipart/form-data',
    };

    return headerHttpRequest;
  }

  static Map<String, dynamic> setHeaderHttpRequestJson() {
    GetStorage box = GetStorage();

    Map<String, dynamic> headerHttpRequest = {
      'Authorization': 'Bearer ${box.read(LocalStorage.tokenJWT)}',
    };

    return headerHttpRequest;
  }
}
