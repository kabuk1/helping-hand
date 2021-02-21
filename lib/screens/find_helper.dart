import 'package:flutter/material.dart';

void main() {
  List<String> names = ["Emma", "William", "Sophia", "Noah"];
  List<double> distances = [0.5, 0.8, 1.0, 1.4];
  runApp(FindHelper(
    items: List<ListItem>.generate(
      4,
      (i) => MessageItem("${names[i]}", "Distance ${distances[i]}"),
    ),
  ));
}

class FindHelper extends StatelessWidget {
  final List<ListItem> items;

  FindHelper({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Find a Helper';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title,
                style: TextStyle(
                  fontSize: 40,
                )),
            toolbarHeight: 60.0,
            backgroundColor: Colors.orange[400],
            leading: IconButton(
              icon: const Icon(Icons.home, size: 40),
              iconSize: 50,
              tooltip: 'Go to Home Screen',
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.map, size: 40),
                iconSize: 50,
                tooltip: 'Map View',
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.message, size: 40),
                iconSize: 50,
                tooltip: 'Messages',
                onPressed: () {},
              ),
            ],
          ),
          body: Container(
            color: Colors.orange[300],
            child: ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: items.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = items[index];

                return Column(children: <Widget>[
                  ListTile(
                      title: item.buildTitle(context),
                      subtitle: item.buildSubtitle(context),
                      trailing: RaisedButton(
                          child: Text("Message",
                              style: TextStyle(
                                color: Colors.black,
                              )),
                          onPressed: () {},
                          color: Colors.orange[50]),
                      contentPadding: EdgeInsets.fromLTRB(20, 5, 20, 5)),
                  Divider(thickness: 3),
                ]);
              },
            ),
          )),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(heading,
//       style: Theme.of(context).textTheme.headline1,
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5));
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) {
    return Text(sender,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ));
  }

  Widget buildSubtitle(BuildContext context) {
    return Text(body,
        style: TextStyle(
          fontSize: 30,
        ));
  }
}
