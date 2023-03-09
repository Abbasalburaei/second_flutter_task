import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteCard extends StatefulWidget {
  final NoteModel data;
  const NoteCard({super.key, required this.data});
  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: widget.data.backgroundColor ??
            const Color.fromRGBO(164, 255, 197, 1),
        child: ListTile(
          onTap: () {},
          title: Text(
            widget.data.title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.data.subTitle),
        ));
  }
}
