import 'package:assignment5_islami/providers/locale_provider.dart';
import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var localProvider = Provider.of<LocaleProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/radio.png",
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.radioFM,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                size: 50,
              ),

/*
              color: themeProvider.currentAppTheme == ThemeMode.light ? MyTheme.lightPrimaryColor : MyTheme.darkPrimaryColor
*/
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                size: 50,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  size: 50,
                )),
          ],
        )
      ],
    );
  }
}
