import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/home/bottom_navigation_item.dart';
import 'package:assignment5_islami/ui/home/hadeeth/hadeeth_tab.dart';
import 'package:assignment5_islami/ui/home/quran/quran_tab.dart';
import 'package:assignment5_islami/ui/home/radio/radio_tab.dart';
import 'package:assignment5_islami/ui/home/sebha/sebha_tab.dart';
import 'package:assignment5_islami/ui/home/settings/settings_tab.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: themeProvider.currentAppTheme == ThemeMode.light ? AssetImage("assets/images/background.png") : AssetImage("assets/images/dark_background.png") ,
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle,style: Theme
              .of(context)
              .textTheme
              .titleLarge),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationItem(iconPath: "assets/images/icon_radio.png", AppLocalizations.of(context)!.radio),
              BottomNavigationItem(iconPath: "assets/images/icon_sebha.png", AppLocalizations.of(context)!.sebha),
              BottomNavigationItem(iconPath:"assets/images/icon_hadeth.png", AppLocalizations.of(context)!.hadeeth),
              BottomNavigationItem(iconPath:"assets/images/icon_quran.png", AppLocalizations.of(context)!.quran),
              BottomNavigationItem(icon: Icon(Icons.settings),AppLocalizations.of(context)!.quran,),

            ]),
        body: tabs[selectedIndex],
      ),
    );
  }
}

List<Widget> tabs=[RadioTab(),SebhaTab(),HadeethTab(),QuranTab(),SettingsTab()];