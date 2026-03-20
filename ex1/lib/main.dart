// Main entry point
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'core/game_loop.dart';
import 'modules/ui/main_menu_screen.dart';
import 'modules/maps/map_manager.dart';
import 'modules/combat/entity_factory.dart';
import 'modules/effects/particle_system.dart';
import 'modules/effects/audio_manager.dart';
import 'modules/core/save_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize core systems in parallel
  await Future.wait([
    ParticleSystem().init(), // Lightweight, fast init
    MapManager().init(), // Load tilesets/maps
    SaveManager().init(), // Setup persistence layer
  ]);

  runApp(const RPGGame());
}

// Game root widget with dependency injection
class RPGGame extends StatelessWidget {
  const RPGGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonfire RPG',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF6C5CE7),
          secondary: const Color(0xFFA29BFE),
          tertiary: const Color(0xFFFD79A8), // Fixed: 'accent' -> 'tertiary'
        ),
      ),
      home: MainMenuScreen(),
    );
  }
}
