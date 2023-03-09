import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:second_task/core/commonComponents/note_card.dart';
import 'package:second_task/core/models/note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchEditingController = TextEditingController();
  final _notes = <NoteModel>[
    NoteModel(
        "Wake up me",
        formatDate(DateTime.now(),
            ["yyyy", "-", "mm", "-", "dd", " ", "hh", ":", "mm", " ", am]),
        null),
    NoteModel(
        "Send second task",
        formatDate(DateTime.now(),
            ["yyyy", "-", "mm", "-", "dd", " ", "hh", ":", "mm", " ", am]),
        const Color.fromRGBO(255, 252, 164, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            sliver: SliverAppBar(
                toolbarHeight: 250,
                title: const Text('NotePad'),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: TextField(
                    controller: _searchEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: InkWell(
                        splashColor: Colors.transparent,
                        child: const Icon(Icons.search),
                        onTap: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Search notes",
                    ),
                  ),
                )),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (_, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: NoteCard(data: _notes[index]));
              },
              childCount: _notes.length,
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {}),
    );
  }
}
