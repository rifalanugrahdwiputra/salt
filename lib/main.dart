import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config/app_config.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const SaltApps()),
  );
}

class SaltApps extends StatefulWidget {
  const SaltApps({Key? key}) : super(key: key);

  @override
  State<SaltApps> createState() => _SaltAppsState();
}

class _SaltAppsState extends State<SaltApps> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppThemes.appTheme,
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.cupertino,
    );
  }
}
