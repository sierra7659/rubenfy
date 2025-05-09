import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rubenfy/character/character.dart';
import 'package:rubenfy/comments/comments.dart';
import 'package:rubenfy/ratings/provider/rating_provider.dart';
import 'package:rubenfy/ratings/ratings.dart';
import 'package:rubenfy/ratings/repository.dart';
import 'package:rubenfy/results/results.dart';
import 'package:rubenfy/widgets/button/button.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  bool _isDisabled(int comfortable, int driving, int talking) {
    return comfortable == 0 || driving == 0 || talking == 0;
  }

  final _ratingsRepository = RatingsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text('Rubenfy'),
        leading: Character(isTalking: false),
        actions: [
          Image.asset('images/corollardo.png', width: 100),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Column(
                  children: [
                    Text('¡Bienvenido a Rubenfy!',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(
                          '¡Califica como esta siendo el viaje, o como ha sido!',
                          style:
                          TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                        width: 200, child: Character(isTalking: true)),
                  ),
                  Flexible(
                      child: Image.asset('images/corollardo.png', width: 200))
                ],
              ),
              const SizedBox(height: 20),
              Ratings(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 38.0, vertical: 10),
                  child: Comments(),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 38.0),
                  child: Consumer<RatingProvider>(
                    builder: (context, ratingProvider, child) =>
                      Buttonfy(
                            text: 'Calificar',
                            isDisabled: _isDisabled(
                                ratingProvider.comfortable,
                                ratingProvider.comfortable,
                                ratingProvider.talking
                            ),
                            onPressed: () {
                              _ratingsRepository.addRating({
                                'comfortable': ratingProvider.comfortable,
                                'driving': ratingProvider.driving,
                                'talking': ratingProvider.talking,
                                'comments': ratingProvider.comments,
                              });
                              Navigator.pushNamed(context, '/results');
                            },
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}