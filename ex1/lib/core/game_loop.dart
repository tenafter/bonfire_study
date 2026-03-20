// Core game loop and state management
import 'dart:async';
import 'package:flutter/gestures.dart' show TickerProviderStateMixin;
import 'package:flame/game.dart';

/// Base GameLoop extending Flame's Game with custom tick rate control
class GameLoop extends FlameGame {
  /// Main game loop running at this tick rate (60fps by default)
  static int tickRate = 60;

  double _deltaTimeBase = 1.0 / tickRate;

  /// Override to control delta time scaling
  double get deltaTime => _deltaTimeBase;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    print('[GameLoop] Initialized at ${tickRate}fps');
  }

  /// Override to customize frame rate (e.g., for mobile battery saving)
  void setTickRate(int newRate) {
    tickRate = newRate;
    _deltaTimeBase = 1.0 / newRate;
  }
}

/// Simple event emitter/observer pattern for game events
class EventEmitter<T extends Object> {
  final List<Function(T)> _listeners = [];

  void on(Function(T) listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  void emit(T data) {
    for (final listener in _listeners) {
      try {
        listener(data);
      } catch (e, s) {
        // Use print instead of debugPrint
        print('[EventEmitter] Error handling event: $e\n$s');
      }
    }
  }

  void clear() => _listeners.clear();
}

/// Combat-specific events
class CombatEvent {
  // Entity was defeated
  static const String entityDefeated = 'entity_defeated';
  // Player gained XP/Level up
  static const String playerProgression = 'player_progression';
  // Status effect applied
  static const String statusEffectApplied = 'status_effect_applied';
}

/// Inventory events
class InventoryEvent {
  static const String itemPickedUp = 'item_picked_up';
  static const String itemEquipped = 'item_equipped';
  static const String inventoryFull = 'inventory_full';
}
