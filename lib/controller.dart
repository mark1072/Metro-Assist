import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:metro_assist/functions/bfs.dart';
import 'package:metro_assist/functions/ticket_price.dart';
import 'package:metro_assist/lines.dart';
import 'package:metro_assist/pages/result_page.dart';

class MetroController extends GetxController {
  var startStation = ''.obs;
  var endStation = ''.obs;

  var path = <String>[].obs;
  var ticketPrice = 0.obs;
  var stationCount = 0.obs;

  void calculateRoute() {
    if (startStation.value.isEmpty || endStation.value.isEmpty) {
      Get.snackbar('Error', 'Please select both stations');
      return;
    }
    if (startStation.value == endStation.value) {
      Get.snackbar('Error', 'Start and End stations cannot be the same!');
      return;
    }

    final allPaths = findShortestRoutes(
      metroMap,
      startStation.value,
      endStation.value,
    );

    if (allPaths.isNotEmpty) {
      path.assignAll(allPaths.first);
    } else {
      path.clear();
    }

    stationCount.value = path.length;
    ticketPrice.value = calculatePrice(stationCount.value);
    debugPrint('START = "${startStation.value}"');
    debugPrint('END   = "${endStation.value}"');
    debugPrint('START EXISTS = ${metroMap.containsKey(startStation.value)}');
    debugPrint('END EXISTS   = ${metroMap.containsKey(endStation.value)}');
    Get.to(() => ResultPage());
  }
}
