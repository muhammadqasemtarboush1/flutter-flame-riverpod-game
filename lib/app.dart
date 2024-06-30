import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/go_green_game.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final GoGreenGame game;
  @override
  void initState() {
    super.initState();
    game = GoGreenGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}
