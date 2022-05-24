import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Belajar Silver AppBar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.collections), text: "Album"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Songs(),
              Gallery(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class Songs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Dan - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Pemuja Rahasia - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Itu Aku - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Lapang Dada - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Seberapa Pantas - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Sahabat Sejati - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Anugerah Terindah yang Pernah Kumiliki - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Sebuah Kisah Klasik - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Janji Kita - Shella On Seven"),
          ),
          ListTile(
            leading: Icon(Icons.audiotrack),
            title: Text("Love Story - Shella On Seven"),
          ),
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  final List images = [
    "assets/images/dua.png",
    "assets/images/8.jpg",
    "assets/images/9.jpg",
    "assets/images/10.jpg",
    "assets/images/11.jpg",
    "assets/images/12.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",
    "assets/images/15.jpg",
    "assets/images/16.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index > 0) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(images[index % 15]),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(images[index]),
            );
          }
        },
      ),
    );
  }
}
