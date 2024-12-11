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

  Future<String> getAllRatings() async {
    final ratings = await firestoreRepository.getData(nameOfCollection);
    return ratings.docs.toString();
  }
}