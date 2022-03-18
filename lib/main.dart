import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ministerial_scale_app/screens/home_page.dart';
import 'package:ministerial_scale_app/utils/color_palette.dart';
import 'package:ministerial_scale_app/utils/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: ColorPalette.primaryColor,
          iconTheme: IconThemeData(color: ColorPalette.primaryColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorPalette.primaryVariant,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorPalette.secondaryColor,
        ),
        useMaterial3: true,
        primaryColor: ColorPalette.primaryColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: ColorPalette.secondaryVariant),
          bodyText2: TextStyle(
            color: ColorPalette.secondaryColor,
            fontFamily: 'Roboto',
          ),
          headline4: TextStyle(color: ColorPalette.secondaryColor),
          headline5: TextStyle(color: ColorPalette.secondaryColor),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
        ),
        body: const HomePage(title: Strings.appName),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
