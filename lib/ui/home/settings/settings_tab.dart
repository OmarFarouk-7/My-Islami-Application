import 'package:assignment5_islami/providers/locale_provider.dart';
import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/home/settings/language_bottom_sheet.dart';
import 'package:assignment5_islami/ui/home/settings/theme_bottom_sheet.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<LocaleProvider>(context);
    var themeProvider= Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 25),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                showLanguageButtonSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: MyTheme.lightPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( provider.currentAppLanguage == "en" ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic
                      ,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.darkPrimaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                    )
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 15,),
            
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: MyTheme.lightPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.currentAppTheme == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyTheme.darkPrimaryColor),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showLanguageButtonSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }


}

