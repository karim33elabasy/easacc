import 'package:flutter/material.dart';
import 'package:easacc/core/utils/app_routes.dart';
import 'package:easacc/core/variables_and_enums/shared_pref_variables.dart';
import 'core/themes/my_theme.dart';
import 'core/widgets/snack_bar_services.dart';
import 'main.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      scaffoldMessengerKey: SnackBarServices.scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: SharedPrefVariables.isDarkMode? ThemeMode.dark : ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: AppRoutes.kAuthScreen,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      );
  }
}