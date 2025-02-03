import 'package:flutter/material.dart';
import 'package:godeeper/models/sermon.dart';
import 'package:godeeper/utils.dart';

class SermonsPage extends StatefulWidget {
  const SermonsPage({super.key, required this.title});

  final String title;

  @override
  State<SermonsPage> createState() => _SermonsPageState();
}

class _SermonsPageState extends State<SermonsPage> {

  Widget getSermons() {
    List<Widget> sermons = Sermon.testData.map((data) {
      Sermon sermon = Sermon.fromMap(data);
      String displayDate = cleanDate(sermon.date);

      return ExpansionTile(
        title: Text('$displayDate - ${sermon.name}'),
        trailing: const Icon(
          Icons.arrow_drop_down_circle,
        ),
        children: [
          ListTile(
            title: Text(sermon.uuid),
          )
        ],
      );
    }).toList();

    return Center(
      child: Column(
        children: sermons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Sermons',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            getSermons(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   tooltip: 'Add Note',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}