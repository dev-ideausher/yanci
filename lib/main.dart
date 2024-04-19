import 'package:camera/camera.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetServices();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp
    ],
  );

  return runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        // theme: AppTheme.light,
        // darkTheme: AppTheme.dark,
        defaultTransition: Transition.fade,
        smartManagement: SmartManagement.full,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        // translationsKeys: AppTranslation.translations,
        initialRoute: AppPages.HOME,
        initialBinding: HomeBinding(),
        getPages: AppPages.routes,
      ),
    ),
  );
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
