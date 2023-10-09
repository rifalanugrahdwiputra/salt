import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salt/app/data/models/users_model.dart';
import 'package:salt/app/data/providers/users_providers.dart';

class HomeController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  UsersProviders usersProviders = UsersProviders();
  var usersData = [].obs;

  getUsersData() async {
    try {
      isLoading.toggle();
      UsersModel response = await usersProviders.getUsers();
      if (response.data!.isNotEmpty) {
        usersData.value = response.data!;
      } else {
        usersData.value = [];
      }
    } on DioError catch (error) {
      print(error);
    } finally {
      isLoading.toggle();
    }
  }
}
