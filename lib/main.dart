import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:uno/core/config/theme.dart';
import 'package:uno/features/home/presentation/pages/home_page.dart';
import 'package:uno/features/game/presentation/provider/game_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set landscape orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uno',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
