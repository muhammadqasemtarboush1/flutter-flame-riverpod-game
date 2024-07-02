import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/components/game_end_state.dart';
import 'package:go_game/game/components/sprites/player.dart';
import 'package:go_game/game/go_green_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
    this.circleHitbox = false,
  });

  final String spritePath;
  final bool circleHitbox;
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    if (circleHitbox == true) {
      add(CircleHitbox());
    } else {
      add(RectangleHitbox());
    }
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash() : super(spritePath: 'trash.png', circleHitbox: true);
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      game.endCallback(GameEndState.trash);

      debugPrint('ObstacleTrash ');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleWater extends Obstacle {
  ObstacleWater() : super(spritePath: 'water.png', circleHitbox: true);

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      game.endCallback(GameEndState.water);
      debugPrint('ObstacleWater ');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleFire extends Obstacle {
  ObstacleFire() : super(spritePath: 'fire.png', circleHitbox: true);
  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
      game.endCallback(GameEndState.fire);

      debugPrint('ObstacleFire ');
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
