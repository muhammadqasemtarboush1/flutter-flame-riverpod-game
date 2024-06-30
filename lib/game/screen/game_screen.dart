import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/go_green_game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GoGreenGame game;
  @override
  void initState() {
    super.initState();
    game = GoGreenGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: gameWidth,
              height: gameHeight,
              child: GameWidget(
                game: game,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
