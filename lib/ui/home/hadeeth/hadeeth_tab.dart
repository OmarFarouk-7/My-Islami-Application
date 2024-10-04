import 'package:assignment5_islami/ui/home/hadeeth/hadeeth_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/my_theme.dart';
import 'hadeeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadeethTab extends StatefulWidget {
  HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<HadeethArgs> ahadeeth = [];

  @override
  void initState() {
    super.initState();
    readHadeethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeeth_header.png",
        ),
        Divider(
          height: 0.95,
          thickness: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppLocalizations.of(context)!.hadeethName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
        ),
        Divider(
          height: 0.95,
          thickness: 3,
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
            onTap: () {
              Navigator.pushNamed(context, HadeethDetails.routeName,arguments: HadeethArgs(ahadeeth[index].name, ahadeeth[index].content));
            },
                child: Text(
                  ahadeeth[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: MyTheme.lightPrimaryColor,
                  ),
                  Icon(Icons.star_border_outlined, color: MyTheme.lightPrimaryColor),
                  Icon(Icons.star_border_outlined, color: MyTheme.lightPrimaryColor),
                ],
              );
            },
            itemCount: ahadeeth.length,
          ),
        )
      ],
    );
  }

  readHadeethFile() async {
    String file = await rootBundle.loadString("assets/ahadeeth/ahadeth.txt");
    List<String> ahadeeth = file.split("#");

    for (int i = 0; i < ahadeeth.length; i++) {
      String hadeeth = ahadeeth[i].trim();
      List<String> hadeethLines = hadeeth.trim().split("\n");
      String name = hadeethLines[0];
      hadeethLines.removeAt(0);
      String content = hadeethLines.join('\n');
      HadeethArgs hadeethArgs = HadeethArgs(name, content);

      this.ahadeeth.add(hadeethArgs);
      setState(() {

      });
    }
  }
}

class HadeethArgs {
  String name;
  String content;

  HadeethArgs(this.name, this.content);
}
