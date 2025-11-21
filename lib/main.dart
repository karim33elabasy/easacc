import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easacc/app_providers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/utils/services_locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,  // Lock to portrait up
  ]);
  await Supabase.initialize(
    url: "https://alioxnrmxcuekbictmxd.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsaW94bnJteGN1ZWtiaWN0bXhkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM3MzA2ODYsImV4cCI6MjA3OTMwNjY4Nn0._gqE3Pjawf84Cc5Wa1hmKGnj1Qrj0A2a6NimRB3ZEIw",
  );
  await setupLocator();

  runApp(
      const AppProviders()
  );
}

