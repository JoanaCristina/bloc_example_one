import 'package:bloc_example_one/src/client/pages/home_page_dois.dart';
import 'package:bloc_example_one/src/core/inject.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePageDois(title: 'Flutter Demo Home Page'),
    );
  }
}

