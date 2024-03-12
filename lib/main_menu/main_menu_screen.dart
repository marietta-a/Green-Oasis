// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_wallet/google_wallet.dart';
import 'package:green_oasis/components/core.dart';
import 'package:green_oasis/components/design_selectors.dart';
import 'package:green_oasis/providers/google_wallet_page.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final designModel = context.read<DesignModel>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: DecoratedBox(
        decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/conservation/fantasy-landscape.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        child: ResponsiveScreen(
          squarishMainArea: Center(
            child: Transform.rotate(
              angle: -0.1,
              child: const Text(
                "Let's build our conservative dream home!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 55,
                  height: 1,
                  color: Colors.red
                ),
              ),
            ),
          ),
          rectangularMenuArea: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // MyGoogleWalletPage(title: 'Premium Subscription',),
              MyButton(
                onPressed: () {
                  audioController.playSfx(SfxType.buttonTap);
                  final levelNumber = designModel.level.number ?? 1;
                  // GoRouter.of(context).go('/play/session/${levelNumber}');
                  GoRouter.of(context).go('/play');
                },
                child: const Text('Play'),
              ),
              _gap,
              MyButton(
                onPressed: () => GoRouter.of(context).push('/settings'),
                child: const Text('Settings'),
              ),
              _gap,
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ValueListenableBuilder<bool>(
                  valueListenable: settingsController.audioOn,
                  builder: (context, audioOn, child) {
                    return IconButton(
                      onPressed: () => settingsController.toggleAudioOn(),
                      icon: Icon(audioOn ? Icons.volume_up : Icons.volume_off),
                    );
                  },
                ),
              ),
              _gap,
              const Text('Music by Mr Smith'),
              _gap,
            ],
          ),
        ),
      )
    );
  }

  static const _gap = SizedBox(height: 10);
}
