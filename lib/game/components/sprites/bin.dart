import 'package:flame/components.dart';
import 'package:go_game/game/components/game_end_state.dart';
import 'package:go_game/game/components/sprites/obstacle.dart';
import 'package:go_game/game/components/sprites/player.dart';

class BinTrash extends Obstacle {
  BinTrash() : super(spritePath: 'bin_trash.png');

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();

      //end state
      game.endCallback(GameEndState.trash);
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
      //win state

      game.endCallback(GameEndState.recycle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
