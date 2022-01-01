import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  ArtRoute({required this.art});
  final String art;
  static int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIdx,
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIdx = value;
          changeRoute(context, _artist);
        },
        items: const [
          BottomNavigationBarItem(
              label: ArtUtil.CARAVAGGIO, icon: Icon(Icons.account_balance)),
          BottomNavigationBarItem(
              label: ArtUtil.MONET, icon: Icon(Icons.account_balance)),
          BottomNavigationBarItem(
              label: ArtUtil.VANGOGH, icon: Icon(Icons.account_balance)),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Choose Your Art',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://images.pexels.com/photos/5245865/pexels-photo-5245865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    ))),
          ),
          ListTile(
            title: Text(ArtUtil.CARAVAGGIO),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
          ),
          ListTile(
            title: Text(ArtUtil.MONET),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.MONET),
          ),
          ListTile(
            title: Text(ArtUtil.VANGOGH),
            trailing: Icon(Icons.art_track),
            onTap: () => changeRoute(context, ArtUtil.VANGOGH),
          ),
        ],
      )),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(art), fit: BoxFit.cover)),
      ),
      appBar: AppBar(actions: [
        PopupMenuButton(
          // child: const Text("Change Route"),
          // icon: const Icon(Icons.image),
          onSelected: (String value) {
            changeRoute(context, value);
          },
          itemBuilder: (BuildContext context) {
            List<PopupMenuEntry<String>> entries = [];
            for (var item in ArtUtil.menuItems) {
              entries.add(PopupMenuItem(
                value: item,
                child: Text(item),
              ));
            }
            return entries;
          },
        )
      ], title: const Text("Navigating Art")),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = "";
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        image = ArtUtil.IMG_CARAVAGGIO;

        break;
      case ArtUtil.MONET:
        image = ArtUtil.IMG_MONET;

        break;
      case ArtUtil.VANGOGH:
        image = ArtUtil.IMG_VANGOGH;

        break;
      default:
    }
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArtRoute(art: image);
    }));
  }
}
