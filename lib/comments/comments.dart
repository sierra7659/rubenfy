import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rubenfy/ratings/provider/rating_provider.dart';

class Comments extends StatelessWidget {
  Comments({Key? key}) : super(key: key);

  final List randomHints = [
    'Mu´majo el chaval este 🥰...',
    'Me encanta este chaval 🥰...',
    'Algo pesado el chaval 🥵...',
    'No me gusta este chaval 😡...',
    'Conduce bien el chaval 🚗...',
    'No me gusta su forma de conducir 🚗...',
    'Me encanta su forma de conducir 🚗...',
    'No me gusta su forma de hablar 🗣️...',
    'Me encanta su forma de hablar 🗣️...',
    'No me gusta su forma de vestir 👕...',
    'Me encanta su forma de vestir 👕...',
    'No me gusta su forma de peinarse 💇...',
    'Me encanta su forma de peinarse 💇...',
    'No me gusta la música que ha puesto 🎵...',
    'Me encanta la música que ha puesto 🎵...',
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final String hintPhrase = randomHints[random.nextInt(randomHints.length)];
    return Column(
      children: [
        Text('Comentarios',
            style: const TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextField(
            onChanged: (value) {
              context.read<RatingProvider>().setComments(value);
            },
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: hintPhrase,
              filled: true,
              focusColor: Colors.black,
              enabledBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 3),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 3),
              ),
              border: const OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black, width: 3),
              ),
            ),
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
