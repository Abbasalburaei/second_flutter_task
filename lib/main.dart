import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_task/core/utils/app_settings.dart';
import 'package:second_task/features/splash_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (_, __, ___) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppSettings.defaultTheme,
        themeMode: ThemeMode.light,
        title: 'second Task',
        home: const SplashPage(),
      );
    });
  }
}
