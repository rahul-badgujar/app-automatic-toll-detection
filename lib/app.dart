import 'package:automatic_toll_app/constants.dart';
import 'package:flutter/material.dart';
import 'page/login-page.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
