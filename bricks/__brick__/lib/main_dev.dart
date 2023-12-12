import 'package:{{name.snakeCase()}}/src/app.dart';
import 'package:{{name.snakeCase()}}/src/common/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  FlavorConfig(
    name: "DEV",
    variables: {
      "baseUrl": "",
    },
  );

  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  runApp(const ProviderScope(child: App()));
}
