import 'package:flutter/material.dart';
import 'package:metro_assist/Models/stations_model.dart';

class StationDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final ValueChanged<String?> onChanged;

  const StationDropdown({
    super.key,
    required this.hint,
    required this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      dropdownMenuEntries: metroStations
          .map((e) => DropdownMenuEntry(value: e.name, label: e.name))
          .toList(),
      width: double.infinity,
      hintText: hint,

      menuHeight: 500,
      enableFilter: true,
      enableSearch: true,
      requestFocusOnTap: true,
      initialSelection: value,
      enabled: true,
      onSelected: onChanged,
    );
  }
}
