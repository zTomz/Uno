import 'package:uno/models/card.dart';
import 'package:uno/models/player.dart';

class GameLogic {
  /// Logic for placing a card
  ///
  /// returns `true` if the card was placed,
  /// returns `false` if the card was not placed
  static bool placeCard(
    List<GameCard> storedBox,
    GameCard card,
    List<Player> players,
    int currentPlayerId,
  ) {
    final Player currentPlayer = players[currentPlayerId];

    // If the stored box is empty, any card can be placed
    if (storedBox.isEmpty) {
      storedBox.add(card);
      currentPlayer.removeCard(card);
      // If the color of both cards match, the card can be placed
    } else if (storedBox.last.color == card.color) {
      storedBox.add(card);
      currentPlayer.removeCard(card);
      // If the value of both cards match, the card can be placed
    } else if (card is DefaultCard &&
        (storedBox.last as DefaultCard).value == card.value) {
      storedBox.add(card);
      currentPlayer.removeCard(card);
      // If the type of both cards match, the card can be placed
    } else if (card is SpecialCard &&
        (storedBox.last as SpecialCard).type == card.type) {
      storedBox.add(card);
      currentPlayer.removeCard(card);
    }

    if (card is SpecialCard) {
      handleSpecialCard(
        storedBox,
        card,
        players,
        currentPlayerId,
      );
    }

    return true;
  }

  static void handleSpecialCard(
    List<GameCard> storedBox,
    SpecialCard card,
    List<Player> players,
    int currentPlayerId,
  ) {
    final nextPlayerId = (currentPlayerId + 1) % players.length;

    switch (card.type) {
      case SpecialCardType.reverse:
        break;
      // Handled in 'game_page.dart', when card is placed
      case SpecialCardType.skip:
        break;
      // Draw two cards
      case SpecialCardType.drawTwo:
        for (int i = 0; i < 2; i++) {
          players[nextPlayerId].addCard(
            DefaultCard.randomCard(),
          );
        }

        break;
      // Draw four cards
      case SpecialCardType.drawFour:
        for (int i = 0; i < 2; i++) {
          players[nextPlayerId].addCard(
            DefaultCard.randomCard(),
          );
        }

        break;
      // Change color
      case SpecialCardType.changeColor:
        // TODO: Implement change color
        storedBox.add(
          SpecialCard(
            type: SpecialCardType.changeColor,
            color: CardColor.green,
          ),
        );
        break;
    }
  }
}
