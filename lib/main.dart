import 'package:chem/block/management.dart';
import 'package:chem/pages/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  ThemeData lightMood(){
    return ThemeData.light().copyWith(
      primaryColor: Colors.lightBlue,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.lightBlueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppManagement>(
      create: (context) => AppManagement(lightMood()),
      child: MaterialWithTheme(),
    );
  }
}

class MaterialWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppManagement>(context);
    return MaterialApp(
      //builder: DevicePreview.appBuilder,
      theme: theme.getTheme(),
      title:'Chemicals',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}


