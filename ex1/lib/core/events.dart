// Core event system for game-wide communication
import 'dart:async';

/// Simple event emitter/observer pattern implementation
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

/// Factory constructor for creating new emitters
class EventFactory {
  static EventEmitter<T> create<T extends Object>() {
    return EventEmitter();
  }
}

/// Combat events for battle mechanics
class CombatEvent {
  static const String entityDefeated = 'entity_defeated';
  static const String playerProgression = 'player_progression';
  static const String statusEffectApplied = 'status_effect_applied';
}

/// Inventory events

class InventoryEvent {
  static const String itemPickedUp = 'item_picked_up';
  static const String itemEquipped = 'item_equipped';
  static const String inventoryFull = 'inventory_full';
}
