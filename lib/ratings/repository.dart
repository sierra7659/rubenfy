import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rubenfy/firebase/repository/repository.dart';

class RatingsRepository {
  final nameOfCollection = 'trips';
  final firestoreRepository = Repository();

  Future<void> addRating(data) async {
    final finalData = {
      'comfortable': data['comfortable'],
      'driving': data['driving'],
      'talking': data['talking'],
      'comments': data['comments'],
      'date': DateTime.now()
    };
    await firestoreRepository.addData(nameOfCollection, finalData);
  }

  Future<List> getAllRatings() async {
    final ratings = await firestoreRepository.getData(nameOfCollection);
    return ratings.docs.toList();
  }

  Future<List> getAllRatingsComfortable() async {
    final ratings = await getAllRatings();
    return ratings.map((rating) => rating['comfortable']).toList();
  }

  Future<List> getAllRatingsDriving() async {
    final ratings = await getAllRatings();
    return ratings.map((rating) => rating['driving']).toList();
  }

  Future<List> getAllRatingsTalking() async {
    final ratings = await getAllRatings();
    return ratings.map((rating) => rating['talking']).toList();
  }

  Future<Map> getAverages() async {
    final ratings = await firestoreRepository.getData(nameOfCollection);
    final comfortable = await getAverageComfortable(ratings);
    final driving = await getAverageDriving(ratings);
    final talking = await getAverageTalking(ratings);
    return {
      'comfortable': comfortable,
      'driving': driving,
      'talking': talking
    };
  }

  Future<int> getAverageComfortable(QuerySnapshot ratings) async {
    final comfortableRatings = ratings.docs.map((rating) => rating['comfortable']).toList();
    final average = comfortableRatings.reduce((a, b) => a + b) / comfortableRatings.length;
    return average.round();
  }

  Future<int> getAverageDriving(QuerySnapshot ratings) async {
    final drivingRatings = ratings.docs.map((rating) => rating['driving']).toList();
    final average = drivingRatings.reduce((a, b) => a + b) / drivingRatings.length;
    return average.round();
  }

  Future<int> getAverageTalking(QuerySnapshot ratings) async {
    final talkingRatings = ratings.docs.map((rating) => rating['talking']).toList();
    final average = talkingRatings.reduce((a, b) => a + b) / talkingRatings.length;
    return average.round();
  }
}