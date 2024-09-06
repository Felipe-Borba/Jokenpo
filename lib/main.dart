import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
      primarySwatch: Colors.red,
    ),
  ));
}


