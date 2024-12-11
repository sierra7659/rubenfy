import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rubenfy/rating/rating.dart';
import 'package:rubenfy/ratings/provider/rating_provider.dart';

class Ratings extends StatelessWidget {
  const Ratings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Rating(text: 'Comodidad', onTap: (val) => context.read<RatingProvider>().setComfortable(val)),
        Rating(text: 'Charla', onTap: (val) => context.read<RatingProvider>().setDriving(val)),
        Rating(text: 'Conducción', onTap: (val) => context.read<RatingProvider>().setTalking(val)),
      ],
    );
  }
}
