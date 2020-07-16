import 'package:chem/constants.dart';
import 'package:chem/dbhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppManagement extends ChangeNotifier{

  ThemeData _themeData;
  AppManagement(this._themeData);

  bool isChange = false;
  void getMood(){
    isChange = !isChange;
    notifyListeners();
  }

  ThemeData lightMood(){
    return ThemeData.light().copyWith(
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.lightBlueAccent,
    );
  }

  setLightMood(){
    _themeData = lightMood();
    notifyListeners();
  }

 ThemeData darkMood(){
    return ThemeData.dark().copyWith(
      primaryColor: Color(0xff1A455B),
      scaffoldBackgroundColor: kAppBodyColor,
      cardColor: kCardTextFieldColor,
    );
 }

 setDarkMood(){
    _themeData = darkMood();
    notifyListeners();
 }

 getTheme() => _themeData;


  DbHelper _dbHelper;
  
  void deleteItem(int id){
    _dbHelper = DbHelper();
    _dbHelper.deleteChemical(id);
    notifyListeners();
  }
}
