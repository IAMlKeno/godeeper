import 'package:flutter/material.dart';
import 'package:godeeper/models/note.dart';
import 'package:godeeper/models/sermon.dart';
import 'package:godeeper/services/sermon_service.dart';

class NoteDetailPage extends StatelessWidget {
  const NoteDetailPage({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {

    Sermon sermon = SermonService.getSermon(note.uuid);

    Widget getTags() {
      if (note.tags!.isNotEmpty) {
        return Column(
          children: [
            Chip(label: Text(note.tags![0].name)),
          ],
        );
      } else {
        return const Column(
          children: [
            Text('NO TAGS FOUND'),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(note.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
              widthFactor: 300,
              child: Column(
                children: [
                  Text(
                    sermon.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Owner: ${note.owner}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  getTags(),
                  const SizedBox(height: 100,),
                  Text(
                    note.body,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ]
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Edit Note',
        child: const Icon(Icons.edit),
      ),
    );
  }
}