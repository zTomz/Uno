import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/features/game/data/models/player.dart';
import 'package:uno/features/game/presentation/provider/game_provider.dart';
import 'package:uno/features/game/presentation/widgets/card_display_widget.dart';

class PlayerCardRow extends StatelessWidget {
  final Player player;

  const PlayerCardRow({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: CardDisplay(
            cards: player.cards,
            overlayWidth: 47.5,
            onTap: (card) {
              game.placeCard(
                player,
                card,
              );
            },
          ),
        ),
        const SizedBox(width: 40),
        Tooltip(
          message: 'Only say "crazy" if you have 1 card left',
          child: ElevatedButton(
            onPressed: () {
              game.setPlayerCrazy(player);
            },
            child: const Text("Crazy"),
          ),
        ),
      ],
    );
  }
}
