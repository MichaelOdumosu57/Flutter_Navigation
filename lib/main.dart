import 'package:flutter/material.dart';
import 'package:pop_up_bar/art_route.dart';
import 'package:pop_up_bar/art_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigationg art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArtRoute(art: ArtUtil.IMG_VANGOGH),
    );
  }
}
