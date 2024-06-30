import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/go_green_game.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GoGreenGame>, CollisionCallbacks {
  Obstacle({
    required this.spritePath,
  });

  final String spritePath;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
}

class ObstacleTrash extends Obstacle {
  ObstacleTrash()
      : super(
          spritePath: 'trash.png',
        );
}

class ObstacleWater extends Obstacle {
  ObstacleWater()
      : super(
          spritePath: 'water.png',
        );
}

class ObstacleFire extends Obstacle {
  ObstacleFire()
      : super(
          spritePath: 'fire.png',
        );
}
