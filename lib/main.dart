import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/splash/bindings/splash_binding.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yanci/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initGetServices();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  generateRandomStockData();

  return runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            color: Colors.white,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            surfaceTintColor: Colors.white,
            color: Colors.white,
          ),
        ),
        // theme: AppTheme.light,
        // darkTheme: AppTheme.dark,
        defaultTransition: Transition.fade,
        smartManagement: SmartManagement.full,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        // translationsKeys: AppTranslation.translations,
        initialRoute: AppPages.INITIAL,
        initialBinding: SplashBinding(),
        getPages: AppPages.routes,
      ),
    ),
  );
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
