import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:green_oasis/pages/mini_games/lpc/lpc_player.dart';
import 'package:green_oasis/pages/mini_games/lpc/lpc_sprite_sheet_loader.dart';
import 'package:green_oasis/pages/mini_games/lpc/widgets/button_interface.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 27/06/22
/// Para funcionar corretamente na web deve executar com flag --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false
/// flutter run -d chrome --web-renderer canvaskit --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false --release
///
/// issue: https://github.com/flutter/flutter/issues/103803
class LPCGame extends StatelessWidget {
  const LPCGame({super.key});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: WorldMapByTiled(
        TiledReader.asset('tiled/mapa2.json'),
        forceTileSize: Vector2(32, 32),
      ),
      cameraConfig: CameraConfig(zoom: 2),
      overlayBuilderMap: {
        ButtonInterface.name: ButtonInterface.builder,
      },
      initialActiveOverlays: [
        ButtonInterface.name,
      ],
      player: LPCPlayer(
        position: Vector2(140, 140),
        customStatus: const CustomStatus(),
      ),
      onDispose: () => FollowerWidget.remove(LPCPlayer.customWidgetKey),
    );
  }
}
