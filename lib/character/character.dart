import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rubenfy/character/character_enum.dart';

class Character extends StatefulWidget {
  bool isTalking = false;
  Character({super.key, this.isTalking = false});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {

  late String characterImage;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    characterImage = characterPositionImages["closedMouth"]!;
    if (widget.isTalking) {
      startSpeaking();
    }
  }

  void startSpeaking() {
    _timer = Timer.periodic(const Duration(milliseconds: 130), (timer) {
      setState(() {
        if (characterImage == characterPositionImages["openMouth"]) {
          characterImage = characterPositionImages["closedMouth"]!;
        } else {
          characterImage = characterPositionImages["openMouth"]!;
        }
      });
    });
  }

  void stopSpeaking() {
    _timer?.cancel();
    setState(() {
      characterImage = characterPositionImages["closedMouth"]!;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(characterImage));
  }
}
