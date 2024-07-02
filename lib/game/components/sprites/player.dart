import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:go_game/game/components/constents.dart';
// import 'package:go_game/game/components/constents.dart';
import '../../go_green_game.dart';

class Player extends SpriteComponent with HasGameRef<GoGreenGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("player.png");
    size = Vector2(playerWidth, playerHeight);
    position = Vector2(0, -(gameRef.size.y / 2) - (size.y / 2));
    angle = 0.5;
    add(RectangleHitbox());
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);
    //falling speed
    double newY = position.y + (dt * 400);
    // let the player stick on the first 1/4 of the screen
    if (newY > -gameHeight / 4) {
      newY = -gameHeight / 4;
    }
    if (newY > (gameRef.size.y / 2) - (size.y / 2)) {
      newY = (gameRef.size.y / 2) - (size.y / 2);
    }

    position.y = newY;
    // anchor = Anchor.bottomCenter;
  }

  void move(double deltaX) {
    if (kDebugMode) {
      print('weeeeeeeeee');
    }
    double newX = position.x + deltaX;
    double minX = -(gameRef.size.x / 2) + size.x / 2; // Left boundary
    double maxX = (gameRef.size.x / 2) - size.x / 2; // Right boundary
    newX = newX.clamp(minX, maxX);
    position.x = newX;
  }
}
