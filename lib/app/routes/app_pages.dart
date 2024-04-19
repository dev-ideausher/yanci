import 'package:get/get.dart';

import '../modules/buy/bindings/buy_binding.dart';
import '../modules/buy/views/buy_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kyc/bindings/kyc_binding.dart';
import '../modules/kyc/views/kyc_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/on_board/bindings/on_board_binding.dart';
import '../modules/on_board/views/on_board_view.dart';
import '../modules/sell/bindings/sell_binding.dart';
import '../modules/sell/views/sell_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/stock_details/bindings/stock_details_binding.dart';
import '../modules/stock_details/views/stock_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.KYC,
      page: () => const KycView(),
      binding: KycBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_DETAILS,
      page: () => const StockDetailsView(),
      binding: StockDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BUY,
      page: () => const BuyView(),
      binding: BuyBinding(),
    ),
    GetPage(
      name: _Paths.SELL,
      page: () => const SellView(),
      binding: SellBinding(),
    ),
  ];
}
