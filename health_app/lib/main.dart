import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/auth/Login.dart';
import 'package:health_app/auth/Signup.dart';
import 'package:health_app/auth/Verification.dart';
import 'package:provider/provider.dart';
import 'package:health_app/حنكشه/favorites_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
