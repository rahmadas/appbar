import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item(this.imageUrl, this.name, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Galery'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  //1
  Item(
    "https://images.wallpaperscraft.com/image/single/octopus_underwater_world_art_131042_1280x720.jpg",
    "Octopus",
    "18.20",
  ),
  //2
  Item(
    "https://i.pinimg.com/originals/40/c3/be/40c3bef82a8077e5c872808eefff5c6d.png",
    "Everest",
    "02.11",
  ),
  //3
  Item(
    "https://image.freepik.com/free-vector/flat-design-baby-shark-cartoon-style_52683-36255.jpg",
    "Shark",
    "21.52",
  ),
  //4
  Item(
    "https://image.freepik.com/free-vector/fairytale-concept-with-child-reading_23-2148472951.jpg",
    "Dreaming",
    "22.11",
  ),
  //5
  Item(
    "https://img.freepik.com/free-vector/spring-landscape-scene_23-2148860692.jpg",
    "Nature",
    "01.12",
  ),
  //6
  Item(
    "https://pw.artfile.me/wallpaper/20-03-2017/650x366/vektornaya-grafika-priroda--nature-sneg--1143282.jpg",
    "Everest 2",
    "23.44",
  ),
  //7
  Item(
    "https://wallpaperaccess.com/full/645620.png",
    "IronHeard",
    "19.20",
  ),
  //8
  Item(
    "https://images.wallpaperscraft.com/image/single/astronaut_spacesuit_reflection_144426_1280x720.jpg",
    "Astronot",
    "20.00",
  ),
  //9
  Item(
    "https://images.wallpaperscraft.com/image/single/deer_art_vector_134088_1280x720.jpg",
    "Deer",
    "14.55",
  ),
  //10
  Item(
    "https://images.wallpaperscraft.com/image/single/minimalism_sky_clouds_sun_mountains_lake_landscape_95458_1280x720.jpg",
    "Kilimanjaro",
    "12.00",
  )
];
