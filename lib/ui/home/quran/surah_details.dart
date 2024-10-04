import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/home/quran/surah_name.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "surah details";

  SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> surahVerses = [];

  @override
  Widget build(BuildContext context) {
    var surah = ModalRoute
        .of(context)
        ?.settings
        .arguments as SurahArgs;
    var themeProvider = Provider.of<ThemeProvider>(context);

    if (surahVerses.isEmpty) {
      readSurahFile(surah.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: themeProvider.currentAppTheme == ThemeMode.light
                  ? AssetImage("assets/images/background.png")
                  : AssetImage("assets/images/dark_background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:
          Text(surah.name, style: Theme
              .of(context)
              .textTheme
              .titleLarge),
        ),
        body: Card(
          elevation: 24,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: themeProvider.currentAppTheme == ThemeMode.light ? Colors.white.withOpacity(0.8) : MyTheme.darkPrimaryColor.withOpacity(0.8),
          margin: EdgeInsets.symmetric(horizontal: 29, vertical: 30),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Text(
                  surahVerses[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: surahVerses.length,
          ),
        ),
      ),
    );
  }

  void readSurahFile(int index) async {
    String fileContent =
    await rootBundle.loadString("assets/surahs/${index + 1}.txt");
    List<String> surahVerses = fileContent.trim().split("\n");
    this.surahVerses = surahVerses;
    setState(() {});
  }
}
