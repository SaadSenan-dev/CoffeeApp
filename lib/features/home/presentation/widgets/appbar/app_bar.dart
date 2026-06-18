import 'package:coffee_app/core/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    this.title = "",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 2), blurRadius: 12, color: Colors.black26)
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(42),
                  bottomRight: Radius.circular(42)),
              color: AppColors.primaryLight),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.sort),
                iconSize: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 52,
              ),
              Text(
                "Coffee Shop",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    color: AppColors.divider),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
