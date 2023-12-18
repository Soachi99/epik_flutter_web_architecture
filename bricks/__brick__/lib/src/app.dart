import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{name.snakeCase()}}/generated/l10n.dart';
import 'package:{{name.snakeCase()}}/src/tools/tools.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => Sizer(
        builder: (context, orientation, deviceType) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: '{{name.snakeCase()}}',
          themeMode: ThemeMode.light,
          theme: t.Theme().theme,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('es')],
        ),
      ),
    );
  }
}
