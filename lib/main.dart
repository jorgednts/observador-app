import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'di/app_module.dart';
import 'generated/l10n.dart';
import 'modules/astro/constants/astro_constant_fonts.dart';
import 'modules/astro/presentation/common/constants/astro_constant_colors.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Astro App',
        theme: ThemeData(
          fontFamily: AstroConstantFonts.roboto,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AstroConstantColors.primaryColor,
            secondary: AstroConstantColors.secondaryColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
