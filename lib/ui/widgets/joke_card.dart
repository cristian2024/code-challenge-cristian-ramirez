import 'package:flutter/material.dart';
import 'package:i_can_haz_dad_joke/domain.dart';
import 'package:i_can_haz_dad_joke/ui.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
  });

  final JokeModel joke;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: joke.id,
      child: Card(
        elevation: 3,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              JokeModal(joke).showModal(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                joke.joke,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
