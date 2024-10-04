import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/locale_provider.dart';
import '../../theme/my_theme.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var localeProvider= Provider.of<LocaleProvider>(context);
    var themeProvider= Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      height: 400,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                //change the ThemeMode value
                themeProvider.changeAppTheme(ThemeMode.light);
              },
              child: themeProvider.currentAppTheme== ThemeMode.light
                  ? getSelectedWidget(AppLocalizations.of(context)!.light)
                  : getUnSelectedWidget(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              //change the themeMode value
              themeProvider.changeAppTheme(ThemeMode.dark);

            },
            child: themeProvider.currentAppTheme== ThemeMode.dark
                ? getSelectedWidget(AppLocalizations.of(context)!.dark)
                : getUnSelectedWidget(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: MyTheme.lightPrimaryColor),
        ),
        Icon(
          Icons.done,
          color: MyTheme.lightPrimaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
