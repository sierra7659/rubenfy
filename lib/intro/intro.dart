import 'package:flutter/material.dart';
import 'package:rubenfy/character/character.dart';
import 'package:rubenfy/rating/rating.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rubenfy')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Column(
                children: [
                  Text('Bienvenido a Rubenfy!', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('Califica como esta siendo el viaje, o como ha sido!', style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    child: Character(isTalking: true)
                ),
                Image.asset('/images/corollardo.png', width: 200)
              ],
            ),
            const SizedBox(height: 20),
            const Rating(text: 'Comodidad'),
            const Rating(text: 'Charla'),
            const Rating(text: 'Conducción'),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10),
                child: Column(
                  children: [
                    Text('Comentarios', style: const TextStyle(fontSize: 20, color: Colors.black)),
                    TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        focusColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        ),
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
