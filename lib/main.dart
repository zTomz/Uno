import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:uno/provider/game_provider.dart';
import 'package:uno/pages/game_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          background: const Color(0xFF141117),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const GamePage(),
    );
  }
}
