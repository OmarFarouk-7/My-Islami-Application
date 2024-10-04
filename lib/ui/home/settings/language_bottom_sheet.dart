import 'package:assignment5_islami/providers/locale_provider.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    //create object from provider inside *Build* function
    var provider = Provider.of<LocaleProvider>(context);
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
                //change the locale value
                provider.changeAppLanguage("en");
              },
              child: provider.currentAppLanguage == "en"
                  ? getSelectedWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedWidget(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              //change the locale value
              provider.changeAppLanguage("ar");
            },
            child: provider.currentAppLanguage == "ar"
                ? getSelectedWidget(AppLocalizations.of(context)!.arabic)
                : getUnSelectedWidget(AppLocalizations.of(context)!.arabic),
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
