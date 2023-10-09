import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Center(
                        child: Text(
                          "data users".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                              color: AppColors.whiteColor,
                              shadowColor:
                                  AppColors.shadowColor.withOpacity(0.15),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/warga.png",
                                      height: 60.0,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Nama : ${controller.usersData[index].email}"
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: 'Quicksand',
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
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
