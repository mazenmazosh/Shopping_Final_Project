import 'package:flutter/material.dart';
import 'package:shoping_final_project/Screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'Components/Products.dart';
import 'package:shoping_final_project/Utilties/Constant.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Productss(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kColor4,
          scaffoldBackgroundColor:Colors.white,
          canvasColor: kColor5,
        ),

 home: HomePage(),
      ),
    );
  }
}