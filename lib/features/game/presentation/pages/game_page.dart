import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/features/game/presentation/provider/game_provider.dart';
import 'package:uno/features/game/presentation/widgets/card_display_widget.dart';
import 'package:uno/features/game/presentation/widgets/card_widget.dart';
import 'package:uno/features/game/presentation/widgets/player_card_row_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();

    context.read<GameProvider>().init(notify: false, cardCount: 2);
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlayerCardRow(player: game.players[0]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget(
                  child: const Text(
                    "New Card",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async {
                    final currentPlayer = game.players[game.currentPlayer];

                    if (game.cardsToDraw > 0) {
                      // Add cardsToDraw to the player
                      await game.handleDrawCards(
                        currentPlayer,
                        null,
                      );
                      return;
                    }

                    game.addRandomCardToPlayer(currentPlayer);
                    game.nextPlayer();
                  },
                ),
                Text(
                  "Current Player: ${game.currentPlayer}\nDirection: ${game.gameDirection}\nCards to draw: ${game.cardsToDraw}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CardDisplay(
                  cards: game.storedCards,
                  overlayWidth: 5,
                ),
              ],
            ),
            PlayerCardRow(player: game.players[1]),
          ],
        ),
      ),
    );
  }
}
