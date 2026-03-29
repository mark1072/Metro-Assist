import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_assist/controller.dart';
import 'package:metro_assist/functions/time.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  final controller = Get.find<MetroController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Result')),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ticket Price: ${controller.ticketPrice.value} EGP'),
                Text('Stations Count: ${controller.stationCount.value}'),
                Text(
                  'Travel Time: ${calculateTravelTime(controller.path)} minutes',
                ),
                const Divider(),
                const Text(
                  'Route:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ...controller.path.map(
                  (s) => Text('• $s', style: const TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
