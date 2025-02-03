import 'package:flutter/material.dart';
import 'package:godeeper/models/note.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({super.key, required this.title});

  final String title;

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {

  Widget getNotes() {
    List<Widget> notes = Note.testData.map((data) {
      Note note = Note.fromMap(data);

      return ExpansionTile(
        title: Text('${note.title} - ${note.created.toString()}'),
        trailing: const Icon(
          Icons.arrow_drop_down_circle,
        ),
        children: [
          ListTile(
            title: Text(note.body),
          )
        ],
      );
    }).toList();

    return Center(
      child: Column(
        children: notes,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // child: Column(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Your notes',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            getNotes(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}