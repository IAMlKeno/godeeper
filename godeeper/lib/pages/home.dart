import 'package:flutter/material.dart';
import 'package:godeeper/models/note.dart';
import 'package:godeeper/pages/all_notes.dart';
import 'package:godeeper/pages/sermons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.notes)),
              Tab(icon: Icon(Icons.meeting_room)),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            MyNotesPage(title: widget.title),
            SermonsPage(title: widget.title),
          ],
        ),
      ),
    );
  }
}