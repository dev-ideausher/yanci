import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';

class NewsController extends GetxController {
  List<String> newsCategories = [
    StringConstants.all,
    StringConstants.trending,
    StringConstants.gse,
    StringConstants.africanFinancials,
  ];

  RxInt selectedCategory = 0.obs;
}
