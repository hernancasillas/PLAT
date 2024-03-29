import 'package:examen_flutter/widgets/drawer.dart';
import 'package:examen_flutter/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class FAQ extends StatelessWidget {
  static const String routeName = '/routes/Vendedores';
  final user;

  FAQ({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: GradientAppBar(
        title: Text('FAQ'),
        gradient: /* LinearGradient(colors: [Colors.blue, Colors.purple, Colors.red]) */
                  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF064B71), const Color(0xFF2692C2)],
              ),
              actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Wrapper()));
              },
            ),
          ],
      ),
        drawer: AppDrawer(user: user),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
          
      );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// raiz
final List<Entry> data = <Entry>[
  Entry(
    'HOW TO ADD A RECIPE',
    <Entry>[
      Entry('-Go Home, press the Icon Plus'),
      Entry('-Select the number of stars for you new recipe'),
      Entry('-Then, add an ingredient, you can add the ingredients you want'),
      Entry('-Introduce the steps of your recipe, inside the box Steps'),
      Entry('-Press Change Picture to select a image for your new recipe'),
      Entry('-Press Add Recipe'),
    ],
  ),
  Entry(
    'I PAID PREMIUM AND I CAN\'T SEE THE BENEFITS',
    <Entry>[
      Entry('-Restart the app'),
      Entry('-If the problem persists, please contact us'),
    ],
  ),
  Entry(
    'MENU OF THE WEEK LOOKS SIMILAR',
    <Entry>[
      Entry('In PLAT we are interested in having more variety, so it is necessary that you introduce more recipes to give you more variety in our recommendations'),
     /* Entry(
        'titulo',
        <Entry>[
          Entry('subti'),
          Entry('subtitulo'),
          Entry('subtitilo'),
        ],
      ),*/
     
    ],
    
  ),
  Entry(
    'CAN I HAVE CALORIE COUNTS?',
    <Entry>[
      Entry('We are trying to improve the app, but right now it does not support this function yet '),
    ],
  ),
  Entry(
    'WHEN DO I HAVE TO PAY PREMIUM AGAIN',
    <Entry>[
      Entry('Premium memberships last forever! Just one payment and that is all'),
    ],
  ),
];


class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}