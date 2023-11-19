import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/provider/game_provider.dart';
import 'package:uno/models/card.dart';
import 'package:uno/widgets/card_display_widget.dart';
import 'package:uno/widgets/card_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();

    context.read<Game>().init();
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<Game>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardDisplay(
              cards: game.players[0].cards,
              onTap: (card) {
                game.placeCard(
                  game.players[0],
                  card,
                );
              },
            ),
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
                  onTap: () {
                    game.addCardToPlayer(
                      game.getCurrentPlayer(),
                      DefaultCard.randomCard(),
                    );
                    game.nextPlayer();
                  },
                ),
                Text(
                  "Current Player: ${game.currentPlayer}",
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
            CardDisplay(
              cards: game.players[1].cards,
              onTap: (card) {
                game.placeCard(
                  game.players[1],
                  card,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
