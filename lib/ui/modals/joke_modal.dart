import 'package:flutter/material.dart';
import 'package:i_can_haz_dad_joke/domain.dart';
import 'package:i_can_haz_dad_joke/ui.dart';

class JokeModal extends BaseModal {
  const JokeModal(this.joke, {super.key});

  final JokeModel joke;

  @override
  void showModal(BuildContext context) {
    showGeneralDialog(
      context: context,
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: this,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return const Text('PAGE BUILDER');
      },
    );
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
