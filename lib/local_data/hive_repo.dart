import 'package:flutter/material.dart';
import 'package:go_game/game/components/game_end_state.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_repo.g.dart';

class HiveRepository {
  final box = Hive.box('gamedata');
  dynamic getValue(String key) {
    return box.get(key);
  }

  void saveAttempt(GameEndState endState) {
    // store key with default value 0 if there is no previous attempts
    final endCounterKey = "${endState.name}EndCount";
    final endCount = box.get(endCounterKey, defaultValue: 0);
    box.put(endCounterKey, endCount + 1);

    debugPrint("Box: ${box.toMap()}");
    // update the key
  }

  int setLevel() {
    final recycleEnd = box.get("recycleEndCount", defaultValue: 0);
    debugPrint("LEVEL: ${(recycleEnd + 1).clamp(1, 5)}");
    return (recycleEnd + 1).clamp(1, 5);
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(HiveRepositoryRef ref) {
  return HiveRepository();
}
