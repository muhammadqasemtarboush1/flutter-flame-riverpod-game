import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_game/game/components/constents.dart';
import 'package:go_game/game/components/go_green_world.dart';

class GoGreenGame extends FlameGame<GoGreenWorld>
    with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  GoGreenGame()
      : super(
          world: GoGreenWorld(),
          camera: CameraComponent.withFixedResolution(
              width: gameWidth, height: gameHeight),
        );

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    debugMode = true;
  }

  @override
  Color backgroundColor() {
    return Colors.yellow;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    print(info);
    world.player.move(info.delta.global.x);
    world.player.move(info.delta.global.x);
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const double moveSpeed = 55.0;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
        world.player.move(moveSpeed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
        world.player.move(-moveSpeed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
}
