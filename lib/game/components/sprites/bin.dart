import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:go_game/game/components/sprites/obstacle.dart';
import 'package:go_game/game/components/sprites/player.dart';
import 'package:go_game/game/go_green_game.dart';

class BinTrash extends Obstacle {
  BinTrash() : super(spritePath: 'bin_trash.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      debugPrint('oops  ');
      print('BinTrash');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class BinRecycle extends Obstacle {
  BinRecycle() : super(spritePath: 'bin_recycle.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      debugPrint('nice ');
      print('BinRecycle');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
