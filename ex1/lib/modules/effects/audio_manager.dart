// Audio & SFX management system
class AudioManager {
  static const int maxSounds = 10; // Concurrent sounds

  bool _initialized = false;
  double masterVolume = 1.0;
  double musicVolume = 1.0;
  double sfxVolume = 1.0;

  /// Initialize audio system
  Future<void> init() async {
    print('[AudioManager] Initializing...');
    await Future.delayed(
      const Duration(milliseconds: 50),
    ); // Simulate asset load
    _initialized = true;
    print('[AudioManager] Ready');
  }

  /// Play sound effect with crossfade
  void playSFX({required String name, double volumeOverride = 1.0}) {
    if (!_initialized) return;
    print('[AudioManager] SFX: $name (vol: ${volumeOverride * sfxVolume})');
  }

  /// Queue background music
  void setMusic({required String track, bool loop = true}) {
    if (!_initialized) return;
    print('[AudioManager] Music: $track (loop: $loop)');
  }
}
