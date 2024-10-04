import 'package:assignment5_islami/ui/home/quran/surah_details.dart';
import 'package:flutter/material.dart';
import '../../theme/my_theme.dart';

class HadeethName extends StatelessWidget {
  String name;
  int index;

  HadeethName(this.name, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
/*
            onTap: () {
              Navigator.pushNamed(context, SurahDetails.routeName,arguments: SurahArgs(englishQuranSurahs[index], index));
            },
*/
            child: Text(
              name,
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
        }, itemCount: index,
      ),
    );
  }
}
