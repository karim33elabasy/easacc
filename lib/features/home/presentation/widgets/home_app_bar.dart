import 'package:easacc/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu)
          ),
          Text("WebView", style: Theme.of(context).textTheme.titleLarge),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.kSettingsScreen);
            },
            icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}
