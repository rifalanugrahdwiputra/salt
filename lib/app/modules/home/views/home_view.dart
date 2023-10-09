import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt/app/utils/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeViewPage();
  }
}

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Users List".toUpperCase(),
          style: const TextStyle(
            fontSize: 16.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.signIn);
                  controller.box.remove(LocalStorage.tokenJWT);
                  controller.box.remove(LocalStorage.isSignIn);
                },
                child: const Card(
                  color: AppColors.cardColor,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value != false) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.usersData.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 800));
                  controller.getUsersData();
                },
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Column(
                        children: [
                          Text(
                            "Data Tidak Ditemukan",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                              fontFamily: 'Quicksand',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 800));
                  controller.getUsersData();
                },
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.usersData.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Card(
                              elevation: 10.0,
                              color: AppColors.cardColor,
                              shadowColor: AppColors.primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                            controller.usersData[index].avatar,
                                            height: 70.0,
                                            width: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.usersData[index].first_name} ${controller.usersData[index].last_name}"
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.whiteColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                "${controller.usersData[index].email}",
                                                style: const TextStyle(
                                                  fontSize: 11.0,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.whiteColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
