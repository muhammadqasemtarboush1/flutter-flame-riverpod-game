import 'package:flutter/material.dart';
import 'package:go_game/game/components/game_end_state.dart';
import 'package:go_game/router.dart';
import 'package:go_router/go_router.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({
    super.key,
    required this.gameEndState,
  });
  final GameEndState gameEndState;
  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Game over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('END STATE ${widget.gameEndState.name}'),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.game.name);
              },
              child: const Text('Play Again'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.menu.name);
              },
              child: const Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
