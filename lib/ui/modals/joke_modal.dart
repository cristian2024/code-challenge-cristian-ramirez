import 'package:flutter/material.dart';
import 'package:i_can_haz_dad_joke/domain.dart';
import 'package:i_can_haz_dad_joke/ui.dart';

class JokeModal extends BaseModal {
  const JokeModal(this.joke, {super.key});

  final JokeModel joke;

  @override
  void showModal(BuildContext context) {
    showDialog(context: context, builder: (context) => this);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: joke.id,
      child: AlertDialog(
        content: Text(
          joke.toString(),
        ),
      ),
    );
  }
}
