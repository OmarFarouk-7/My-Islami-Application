import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class LocaleProvider extends ChangeNotifier{
  // data
  String currentAppLanguage= "en";

  changeAppLanguage(String newAppLanguage){
    if (currentAppLanguage == newAppLanguage)
      {return;}
    currentAppLanguage= newAppLanguage;

    //notify listeners
    notifyListeners();
  }


}