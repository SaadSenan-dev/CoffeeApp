import 'package:coffee_app/core/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

Future<Map<String, bool>?> showFilterDialog(BuildContext context) async {
  bool hotCoffee = false;
  bool coldCoffee = false;
  bool withMilk = false;

  return showDialog<Map<String, bool>>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            actionsPadding: const EdgeInsets.fromLTRB(26, 0, 16, 4),
            title: Row(
              children: const [
                Icon(
                  Icons.tune_rounded,
                  color: AppColors.primary,
                ),
                SizedBox(width: 10),
                Text(
                  "Filter Coffee",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckboxListTile(
                      activeColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text("Hot Coffee"),
                      secondary: const Icon(
                        Icons.local_fire_department,
                        color: AppColors.primary,
                      ),
                      value: hotCoffee,
                      onChanged: (value) {
                        setState(() {
                          hotCoffee = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      activeColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text("Cold Coffee"),
                      secondary: const Icon(
                        Icons.ac_unit,
                        color: AppColors.primary,
                      ),
                      value: coldCoffee,
                      onChanged: (value) {
                        setState(() {
                          coldCoffee = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      activeColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text("With Milk"),
                      secondary: const Icon(
                        Icons.local_cafe,
                        color: Colors.brown,
                      ),
                      value: withMilk,
                      onChanged: (value) {
                        setState(() {
                          withMilk = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.brown,
                        side: const BorderSide(color: Colors.brown),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, {
                          "hot": hotCoffee,
                          "cold": coldCoffee,
                          "milk": withMilk,
                        });
                      },
                      child: const Text("Apply"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
