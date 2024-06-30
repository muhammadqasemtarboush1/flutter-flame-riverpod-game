import 'dart:async';

import 'package:flame/components.dart';
import 'package:go_game/game/components/sprites/bin.dart';
import 'package:go_game/game/components/sprites/player.dart';
import 'package:go_game/game/go_green_game.dart';

class GoGreenWorld extends World with HasGameRef<GoGreenGame> {
  late final Player player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Player();

    add(player);
    add(Bin());

    // loadLevel(LevelData().getLevel(game.level));
  }
}
