import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/components/game_end_state.dart';
import 'package:go_game/game/go_green_game.dart';
import 'package:go_game/local_data/hive_repo.dart';
import 'package:go_game/router.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late final GoGreenGame game;
  @override
  void initState() {
    super.initState();
    if (ref.read(canPlaySoundProvider) == true) {
      FlameAudio.bgm.initialize();
      FlameAudio.bgm.play('bg_game.mp3', volume: 0.2);
    }
    game = GoGreenGame(
      level: ref.read(hiveRepositoryProvider).setLevel(),
      endCallback: (GameEndState endState) {
        // save attempts
        // FlameAudio.bgm.play('bg_end.mp3');
        // FlameAudio.bgm.stop();
        ref.read(hiveRepositoryProvider).saveAttempt(endState);

        // redirecting
        switch (endState) {
          case GameEndState.trash:
            context.goNamed(AppRoute.endTrash.name);
            break;
          case GameEndState.water:
            context.goNamed(AppRoute.endWater.name);
            break;
          case GameEndState.fire:
            context.goNamed(AppRoute.endFire.name);
            break;
          case GameEndState.recycle:
            context.goNamed(AppRoute.endRecycle.name);
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              width: gameWidth,
              height: gameHeight,
              child: GameWidget(game: game),
            ),
          ),
        ),
      ),
    );
  }
}
