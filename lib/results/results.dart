import 'package:flutter/material.dart';
import 'package:rubenfy/character/character.dart';
import 'package:rubenfy/rating/icon.dart';
import 'package:rubenfy/ratings/chart.dart';
import 'package:rubenfy/ratings/repository.dart';
import 'package:rubenfy/results/charts.dart';
import 'package:rubenfy/results/ratings/ratings.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingsRepository = RatingsRepository();
    return Scaffold(
      body: FutureBuilder(
        future: ratingsRepository.getAverages(),
        builder: (context, ratings) {
          if (ratings.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '¡Muchas gracias por tu valoración! esto es lo que opina el resto.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                Center(
                  child: Character(isTalking: true),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'Valoraciones Generales',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RatingsResults(text: 'Comodidad', value: ratings.data?['comfortable']),
                    RatingsResults(text: 'Conducción', value: ratings.data?['driving']),
                    RatingsResults(text: 'Charla', value: ratings.data?['talking']),
                  ],
                ),
                FutureBuilder(
                  future: ratingsRepository.getAllRatings(),
                  builder: (context, ratings) {
                    if (ratings.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final comfortableWithDate = ratings.data!.map((rating) => {'value': rating['comfortable'], 'date': rating['date']}).toList();
                    final drivingWithDate = ratings.data!.map((rating) => {'value': rating['driving'], 'date': rating['date']}).toList();
                    final talkingWithDate = ratings.data!.map((rating) => {'value': rating['talking'], 'date': rating['date']}).toList();
                    final comments = ratings.data!.map((rating) => rating['comments']).toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text('Estadisticas y comentarios', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Row(
                                    children: [
                                      Expanded(child: Charts(title: 'Comodidad', data: comfortableWithDate)),
                                      Expanded(child: Charts(title: 'Conducción', data: drivingWithDate)),
                                      Expanded(child: Charts(title: 'Charla', data: talkingWithDate)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 28.0),
                            child: SizedBox(
                              height: 200, // Adjust height as needed
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  if (comments[index] == '') {
                                    return Container();
                                  }
                                  return Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(comments[index], style: TextStyle(fontSize: 20, color: Colors.black)),
                                  );
                                },
                                itemCount: comments.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}