// Entity creation pool - combat system factory
import '../../core/events.dart';
import 'dart:math' as math;

/// Base entity class for game objects (enemies, NPCs)
class BaseEntity {
  int id = 0;
  double health = 100.0;
  double maxHealth = 100.0;
  String name = 'Unknown';

  void takeDamage(double amount) {
    health -= amount;
    if (health <= 0) {
      health = 0;
      _onDeath();
    }
  }

  void heal(double amount) {
    maxHealth += amount; // Grow max health
    health = math.min(health + amount, maxHealth);
  }

  double get percentHealth => (health / maxHealth).clamp(0.0, 1.0);

  void _onDeath() {
    // Use the event constants directly as strings
    EventFactory.create().emit('entity_defeated');
  }
}

/// Enemy type definitions with balanced stats
enum EnemyType { slime, goblin, orc, skeleton, troll, boss_golem }

/// Entity Factory - singleton pattern for entity creation pool
class EntityFactory {
  static final EntityFactory _instance = EntityFactory._internal();
  factory EntityFactory() => _instance;

  EntityFactory._internal();

  /// Get a fresh enemy of specified type
  BaseEntity getEnemy(EnemyType type) {
    // TODO: Return typed enemies with proper stats
    return BaseEntity();
  }

  /// Get hero instance (singleton)
  BaseEntity getHero() {
    // TODO: Single player character instance
    return BaseEntity();
  }
}
