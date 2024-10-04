import 'package:assignment5_islami/providers/theme_provider.dart';
import 'package:assignment5_islami/ui/home/hadeeth/hadeeth_tab.dart';
import 'package:assignment5_islami/ui/theme/my_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HadeethDetails extends StatelessWidget {
  static const String routeName = "hadeeth details";

  HadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeeth = ModalRoute.of(context)?.settings.arguments as HadeethArgs;
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        themeProvider.currentAppTheme == ThemeMode.light
            ? Image.asset("assets/images/background.png")
            : Image.asset("assets/images/dark_background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(hadeeth.name,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: SizedBox(
            height: 750,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 20,
              color: themeProvider.currentAppTheme == ThemeMode.light
                  ? Colors.white.withOpacity(0.8)
                  : MyTheme.darkPrimaryColor.withOpacity(0.8),
              margin: EdgeInsets.symmetric(horizontal: 29, vertical: 24),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  hadeeth.content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
