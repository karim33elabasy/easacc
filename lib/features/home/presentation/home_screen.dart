import 'package:easacc/core/widgets/app_scaffold.dart';
import 'package:easacc/core/widgets/side_menu.dart';
import 'package:easacc/features/home/presentation/widgets/app_web_view.dart';
import 'package:easacc/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: SideMenu(),
      appBar: HomeAppBar(),
      body: const AppWebView(
      url: "https://www.google.com",
        ),
    );
  }
}
