import 'package:flutter/material.dart';
import 'package:uno/models/card.dart';
import 'package:uno/models/game_logic.dart';
import 'package:uno/models/player.dart';
import 'package:uno/widgets/card_display_widget.dart';
import 'package:uno/widgets/card_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Player> players = [];
  List<GameCard> storedCards = [];

  // Variables for the player state
  int currentPlayer = 0;
  int playerCount = 2;

  @override
  void initState() {
    super.initState();

    // Creating the players
    for (int i = 0; i < playerCount; i++) {
      players.add(Player(id: i));
    }

    // Adding some random cards to each player
    for (Player player in players) {
      for (int i = 0; i < 7; i++) {
        player.addCard(DefaultCard.randomCard());
      }
      player.addCard(SpecialCard.randomColor(SpecialCardType.skip));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardDisplay(
              cards: players[0].cards,
              onTap: (card) {
                // Don't place a card if it's not your turn
                if (players[0].id != currentPlayer) {
                  return;
                }

                // No need to update state, if no card is palced
                if (GameLogic.placeCard(
                      storedCards,
                      card,
                      players,
                      currentPlayer,
                    ) ==
                    false) return;

                // Change the player, unless the card is a skip

                if (!(card is SpecialCard &&
                    card.type == SpecialCardType.skip)) {
                  currentPlayer = (currentPlayer + 1) % playerCount;
                }

                setState(() {});
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
                    players[currentPlayer].addCard(DefaultCard.randomCard());

                    currentPlayer = (currentPlayer + 1) % playerCount;

                    setState(() {});
                  },
                ),
                Text(
                  "Current Player: $currentPlayer",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CardDisplay(
                  cards: storedCards,
                  overlayWidth: 5,
                ),
              ],
            ),
            CardDisplay(
              cards: players[1].cards,
              onTap: (card) {
                // Don't place a card if it's not your turn
                if (players[1].id != currentPlayer) {
                  return;
                }

                // No need to update state, if no card is palced
                if (GameLogic.placeCard(
                      storedCards,
                      card,
                      players,
                      currentPlayer,
                    ) ==
                    false) return;

                // Change the player, unless the card is a skip
                if (card is SpecialCard) {
                  print("Special Card");

                  if (card.type != SpecialCardType.skip) {
                    currentPlayer = (currentPlayer + 1) % playerCount;
                  }
                }

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
