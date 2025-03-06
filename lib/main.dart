import 'package:auto_diary/features/authentication/presentation/pages/auth_gate.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? 'default',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? 'default',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Diary',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.materialBaseline),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.materialBaseline),
      themeMode: ThemeMode.system,
      home: AuthGate(),
    );
  }
}
