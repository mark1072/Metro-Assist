// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_assist/Models/stations_model.dart';
import 'package:metro_assist/controller.dart';
import 'package:metro_assist/functions/get_coordinates.dart';
import 'package:metro_assist/functions/get_location.dart';
import 'package:metro_assist/functions/nearest_station.dart';
import 'package:metro_assist/functions/wrapper.dart';
import 'package:metro_assist/permissions/location_permission.dart';
import 'package:metro_assist/widgets/station_dropdown.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(MetroController());
  final placeController = TextEditingController();
  final placeText = ''.obs;

  @override
  Widget build(BuildContext context) {
    placeController.addListener(() {
      placeText.value = placeController.text.trim();
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/metro.png', height: 50),
            const Text(' Cairo Metro'),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔹 START STATION CARD
              _buildCard(
                color: Colors.deepPurple,
                title: "Start Station",
                child: Obx(() {
                  final startStation = controller.startStation.value;
                  return Row(
                    children: [
                      Expanded(
                        child: StationDropdown(
                          hint: 'Select Start Station',
                          value: startStation.isEmpty ? null : startStation,
                          onChanged: (value) {
                            controller.startStation.value = value!;
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.my_location,
                          color: startStation.isEmpty
                              ? Colors.grey
                              : Colors.red,
                        ),
                        onPressed: startStation.isEmpty
                            ? null
                            : () async {
                                final station = metroStations.firstWhere(
                                  (s) => s.name == startStation,
                                );

                                final url =
                                    'https://www.google.com/maps/search/?api=1&query=${station.lat},${station.lng}';

                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url));
                                }
                              },
                      ),
                    ],
                  );
                }),
              ),

              const SizedBox(height: 16),

              /// 🔹 PLACE SEARCH CARD
              _buildCard(
                color: Colors.redAccent,
                title: "Find Nearest Station from Place",
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: placeController,
                        decoration: InputDecoration(
                          hintText: "Enter place name",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Obx(() {
                      return ElevatedButton.icon(
                        onPressed: placeText.value.isNotEmpty
                            ? () async {
                                final placeName = placeText.value;

                                try {
                                  final coordinates =
                                      await getCoordinatesFromPlace(placeName);

                                  final nearestStation =
                                      findNearestStationFromLatLng(
                                        coordinates,
                                        metroStations,
                                      );

                                  controller.endStation.value =
                                      nearestStation.name;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Nearest station to "$placeName" is ${nearestStation.name}',
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: $e')),
                                  );
                                }
                              }
                            : null,
                        icon: const Icon(Icons.near_me),
                        label: const Text("Find"),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// 🔹 END STATION CARD
              _buildCard(
                color: Colors.deepPurple,
                title: "Destination Station",
                child: Obx(() {
                  return StationDropdown(
                    hint: 'Select End Station',
                    value: controller.endStation.value.isEmpty
                        ? null
                        : controller.endStation.value,
                    onChanged: (value) {
                      controller.endStation.value = value!;
                    },
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// 🔹 ACTION BUTTONS
              _buildActionButton(
                icon: Icons.location_on,
                text: "Find Nearest Station",
                onPressed: () async {
                  try {
                    await requestLocationPermission();
                    final position = await getUserLocation();

                    final nearestStation = findNearestStation(
                      position,
                      metroStations,
                    );

                    controller.startStation.value = nearestStation.name;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nearest station: ${nearestStation.name}',
                        ),
                      ),
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
              ),

              const SizedBox(height: 12),

              Obx(() {
                final isEnabled =
                    controller.startStation.value.isNotEmpty &&
                    controller.endStation.value.isNotEmpty;

                return _buildActionButton(
                  icon: Icons.route,
                  text: "Calculate Route",
                  onPressed: isEnabled ? controller.calculateRoute : null,
                  isPrimary: true,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔲 CARD WIDGET
  Widget _buildCard({
    required String title,
    required Widget child,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  /// 🔘 BUTTON WIDGET
  Widget _buildActionButton({
    required IconData icon,
    required String text,
    required VoidCallback? onPressed,
    bool isPrimary = false,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: isPrimary ? Colors.redAccent : Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
