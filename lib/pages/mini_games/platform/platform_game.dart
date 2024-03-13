import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_oasis/pages/mini_games/platform/fox_player.dart';
import 'package:green_oasis/pages/mini_games/platform/frog_enemy.dart';
import 'package:green_oasis/pages/mini_games/platform/gem_decoration.dart';
import 'package:green_oasis/pages/mini_games/platform/platform_game_controller.dart';

class PlatformGame extends StatefulWidget {
  const PlatformGame({super.key});

  @override
  State<PlatformGame> createState() => _PlatformGameState();
}

class _PlatformGameState extends State<PlatformGame> {
  Key _gameKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      key: _gameKey,
      map: WorldMapByTiled(
        TiledReader.asset('platform/platform_map.tmj'),
        objectsBuilder: {
          'frog': (properties) => FrogEnemy(
                position: properties.position,
              ),
          'gem': (properties) => GemDecoration(
                position: properties.position,
              ),
        },
      ),
      keyboardConfig: KeyboardConfig(
        acceptedKeys: [
          LogicalKeyboardKey.space,
        ],
      ),
      joystick: Joystick(
        directional: JoystickDirectional(
          color: Colors.green,
        ),
        actions: [
          JoystickAction(
            actionId: 1,
            margin: const EdgeInsets.all(50),
            color: Colors.green,
          ),
        ],
      ),
      components: [PlatformGameController(reset: reset)],
      backgroundColor: const Color(0xFF2fbdff),
      globalForces: [
        GravityForce2D(),
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: getZoomFromMaxVisibleTile(context, 16, 25),
        speed: 4,
      ),
      player: FoxPlayer(
        position: Vector2(50 * 16, 3 * 16),
      ),
    );
  }

  void reset() {
    setState(() {
      _gameKey = UniqueKey();
    });
  }
}
