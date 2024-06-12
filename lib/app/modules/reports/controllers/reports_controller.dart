import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportsController extends GetxController {
  Rx<DateTime> selectedDateTime = DateTime.now().obs;

  List<String> past12Months = [];
  List<DateTime> past12MonthsDateTime = [];
  RxString selectedMonth = "This month".obs;
  Rx<DateTime> selectedMonthDateTime = DateTime.now().obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    generatePast12Months();
  }

  void generatePast12Months() {
    DateTime now = DateTime.now();
    for (int i = 0; i < 12; i++) {
      DateTime month = DateTime(now.year, now.month - i, 1);
      past12Months.add(i == 0 ? "This month" : DateFormat('MMMM yyyy').format(month));
      past12MonthsDateTime.add(month);
    }
  }

  void selectMonth(String? newValue) {
    selectedMonth.value = newValue!;
    selectedIndex.value = past12Months.indexOf(newValue);
    selectedMonthDateTime.value = past12MonthsDateTime[selectedIndex.value];
  }
}
