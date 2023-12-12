import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:{{name.snakeCase()}}/src/tools/theme.dart' as t;
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
    var size = MediaQuery.of(context).size;
    var deviceType = getDeviceType(size);

    return ResponsiveApp(
      builder: (context) => OrientationBuilder(builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: getDesignSizeByScreen(deviceType, orientation, size),
          rebuildFactor: RebuildFactors.always,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: '{{name.snakeCase()}}',
            themeMode: ThemeMode.light,
            theme: t.Theme().theme,
            routerConfig: goRouter,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        );
      }),
    );
  }
}

Size getDesignSizeByScreen(
    DeviceScreenType deviceType, Orientation orientation, Size size) {
  switch (deviceType) {
    case DeviceScreenType.mobile:
      return const Size(375, 812);
    case DeviceScreenType.tablet:
      return orientation == Orientation.portrait
          ? Size(size.height, size.width)
          : const Size(1024, 1280);
    case DeviceScreenType.desktop:
      return orientation == Orientation.landscape
          ? Size(size.width, size.height)
          : Size(size.height, size.width);
    default:
      return orientation == Orientation.landscape
          ? Size(size.width, size.height)
          : Size(size.height, size.width);
  }
}
