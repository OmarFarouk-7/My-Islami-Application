import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int doaaCounter = 0;
  int index=0;
  List<String> doaa = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله"
  ];
  late String doaaText = doaa[0];


  changeDoaaText(){
    doaaText= doaa[index];
  }
  changeDoaaCounter(){
    if (doaaCounter < 33){
      changeDoaaText();
      doaaCounter++;
    }
    else{
      doaaCounter=0;
      if(index<3) {
        index++;
      }
      else{
        index=0;
      }
      changeDoaaText();
    }
  }
  tasbeeh() {
   changeDoaaCounter();
  }

  double angle= 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 95.0),
                child: Image.asset(
                  color: themeProvider.currentAppTheme == ThemeMode.light
                      ? MyTheme.lightPrimaryColor
                      : Color(0xffFACC1D),
                  "assets/images/head_of_sebha.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Transform.rotate(angle: 50,
                  child: InkWell(
                    onTap: () {
                      rotateSebha();
                      tasbeeh();

                    },
                    child: Transform.rotate(
                      angle: angle * (3.1416 / 180),
                      child: Image.asset(
                          "assets/images/body_of_sebha.png",
                          color: themeProvider.currentAppTheme == ThemeMode.light
                              ? MyTheme.lightPrimaryColor
                              : Color(0xffFACC1D),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.numberOfTasbeeh,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 8),
            child: Text(
              doaaCounter.toString(),
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
            ),
            decoration: BoxDecoration(
                color: themeProvider.currentAppTheme == ThemeMode.light
                    ? MyTheme.lightPrimaryColor
                    : MyTheme.darkPrimaryColor,
                borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.all(15),
          ),
          InkWell(
            onTap: () {
              rotateSebha();
              tasbeeh();
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.all(12),
              child: Text(
                doaaText,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: themeProvider.currentAppTheme == ThemeMode.light
                        ? Colors.white
                        : Colors.black),
              ),
              decoration: BoxDecoration(
                  color: themeProvider.currentAppTheme == ThemeMode.light
                      ? MyTheme.lightPrimaryColor
                      : Color(0xffFACC1D),
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(8),
            ),
          ),
        ],
      ),
    );
  }

  void rotateSebha() {
    angle += 35;
    setState(() {

    });
  }
}
