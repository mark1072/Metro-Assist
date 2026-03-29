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
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/metro.png', height: 50),
            const Text(' Route'),
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 💳 Summary Card
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          Icons.attach_money,
                          'Ticket Price',
                          '${controller.ticketPrice.value} EGP',
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          Icons.straighten,
                          'Stations Count',
                          '${controller.stationCount.value}',
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          Icons.access_time,
                          'Travel Time',
                          '${calculateTravelTime(controller.path)} minutes',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🛣 Route Title
                const Text(
                  'Route',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                /// 🚇 Route List
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.path.length,
                      separatorBuilder: (_, _) => const Divider(height: 10),
                      itemBuilder: (context, index) {
                        final station = controller.path[index];

                        return Row(
                          children: [
                            const Icon(Icons.circle, size: 10),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                station,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Reusable row widget
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
