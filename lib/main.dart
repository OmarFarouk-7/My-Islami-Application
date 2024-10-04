import 'package:assignment5_islami/providers/locale_provider.dart';
import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/home/hadeeth/hadeeth_details.dart';
import 'package:assignment5_islami/ui/home/home.dart';
import 'package:assignment5_islami/ui/home/quran/surah_details.dart';
import 'package:assignment5_islami/ui/splash/splash_screen.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // creates object from provider inside *build* function
    var localeProvider= Provider.of<LocaleProvider>(context);
    var themeProvider= Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeProvider.currentAppTheme,

      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(localeProvider.currentAppLanguage),
      

      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        Home.routeName:(_)=>Home(),
        SurahDetails.routeName:(_)=>SurahDetails(),
        HadeethDetails.routeName:(_)=>HadeethDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
