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
      home: DefaultTabController(
        child: Scaffold(
          body: TabBarView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ArtUtil.IMG_CARAVAGGIO),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ArtUtil.IMG_MONET),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ArtUtil.IMG_VANGOGH),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          appBar: AppBar(
              title: const Text('Art Tab'),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.art_track), text: ArtUtil.CARAVAGGIO),
                Tab(icon: Icon(Icons.art_track), text: ArtUtil.MONET),
                Tab(icon: Icon(Icons.art_track), text: ArtUtil.VANGOGH)
              ])),
        ),
        length: 3,
      ),
    );
  }
}
