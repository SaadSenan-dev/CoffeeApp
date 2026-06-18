import 'package:coffee_app/core/routing/app_routes.dart';
import 'package:coffee_app/core/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF8F5F2),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Saad User",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "saad@email.com",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _drawerItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.coffee,
            title: "Coffee Menu",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.favorite,
            title: "Favorites",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.shopping_cart,
            title: "Cart",
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: Colors.red.withOpacity(0.1),
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(icon, color: AppColors.primaryLight),
        title: Text(title),
        onTap: onTap,
        hoverColor: Colors.brown.withOpacity(0.1),
      ),
    );
  }
}
