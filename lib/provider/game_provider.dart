import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno/models/card.dart';
import 'package:uno/models/player.dart';

class GameProvider extends ChangeNotifier {
  final List<Player> players = [];
  List<GameCard> storedCards = [];
  int currentPlayer = 0;

  /// Direction the players change - 1 for next player, -1 for previous player
  int gameDirection = 1;

  /// A counter to keep track of the number of cards to draw
  ///
  /// Set to `0` by default, when a card is placed, it will check,
  /// if it is higher than 1, it will check if the choosen card is
  /// also a +2 or +4, else it will add it to the cards of the current
  /// player.
  int cardsToDraw = 0;

  /// Initialize the game
  ///
  /// `notify` - set to `false` by default
  void init({int playerCount = 2, int cardCount = 7, bool notify = false}) {
    players.clear();
    storedCards.clear();
    currentPlayer = 0;

    for (int i = 0; i < playerCount; i++) {
      players.add(Player(id: i));
    }

    for (int i = 0; i < players.length; i++) {
      addRandomCardToPlayer(players[i], count: 7, notify: false);
    }

    if (notify) {
      notifyListeners();
    }
  }

  /// Add a player to the game
  void addPlayer() {
    players.add(Player(id: players.length));

    notifyListeners();
  }

  /// Remove a player from the game
  void removePlayer(Player player) {
    players.remove(player);

    for (int i = 0; i < players.length; i++) {
      players[i].id = i;
    }

    notifyListeners();
  }

  /// Change the current player to the next player
  void nextPlayer() {
    currentPlayer = (currentPlayer + gameDirection) % players.length;

    notifyListeners();
  }

  /// Get the current player
  Player getCurrentPlayer() {
    return players[currentPlayer];
  }

  /// Get the next player
  Player getNextPlayer() {
    return players[(currentPlayer + gameDirection) % players.length];
  }

  /// Add a card to the current player
  void addCardToPlayer(Player player, GameCard card, {bool notify = false}) {
    player.addCard(card);

    if (notify) {
      notifyListeners();
    }
  }

  void addRandomCardToPlayer(Player player,
      {int count = 1, bool notify = true}) {
    for (int i = 0; i < count; i++) {
      // Add a random card
      player.addCard(GameCard.randomCard());
    }

    if (notify) {
      notifyListeners();
    }
  }

  /// Place a card
  Future<void> placeCard(Player player, GameCard card) async {
    // Check if the player is the current player
    // If not, return
    if (currentPlayer != player.id) {
      return;
    }

    debugPrint("Card can be placed: ${cardCanBePlaced(card)}");
    if (card is SpecialCard && cardCanBePlaced(card)) {
      // Place the card
      storedCards.add(card);
      player.removeCard(card);

      // Handle special card
      switch (card.type) {
        case SpecialCardType.drawTwo:
          await handleDrawCards(player, card);
          return;
        case SpecialCardType.drawFour:
          await handleDrawCards(player, card);
          return;
        case SpecialCardType.reverse:
          if (gameDirection >= 1) {
            gameDirection = -1;
          } else {
            gameDirection = 1;
          }
          break;
        case SpecialCardType.skip:
          currentPlayer = currentPlayer + 1;
          if (currentPlayer >= players.length) {
            currentPlayer = 0;
          }
          break;
        case SpecialCardType.changeColor:
          final choosenColor = await colorChooserDialog();

          storedCards.last.color = choosenColor;
          break;
      }

      // Card is already placed
      nextPlayer();
      return;
    }

    // Places a default card
    if (cardCanBePlaced(card) && cardsToDraw <= 0) {
      storedCards.add(card);
      player.removeCard(card);

      nextPlayer();
    }

    if (cardsToDraw > 0) {
      await handleDrawCards(player, null);
      return;
    }
  }

  /// Check if a card can be placed
  bool cardCanBePlaced(GameCard card) {
    // If the stored box is empty, any card can be placed
    if (storedCards.isEmpty) {
      return true;
    }

    // If the color of both cards match, the card can be placed
    if (storedCards.last.color == card.color) {
      return true;
    }

    if (card is DefaultCard) {
      if (storedCards.last is DefaultCard) {
        // If the value of both cards match, the card can be placed
        if ((storedCards.last as DefaultCard).value == card.value) {
          return true;
        }
      }
    }

    if (card is SpecialCard) {
      if (storedCards.last is SpecialCard) {
        // If the type of both cards match, the card can be placed
        if ((storedCards.last as SpecialCard).type == card.type) {
          return true;
        }
      }

      switch (card.type) {
        case SpecialCardType.drawFour:
          return true;
        case SpecialCardType.changeColor:
          return true;
        default:
          break;
      }
    }

    return false;
  }

  /// Checks if the card is a +2 or +4 => `cardsToDraw` get incremented
  /// else `cardsToDraw` get added to the player
  Future<void> handleDrawCards(Player player, SpecialCard? card) async {
    if (card == null) {
      // Add `cardsToDraw` to the player
      addRandomCardToPlayer(player, count: cardsToDraw, notify: false);
      cardsToDraw = 0;

      nextPlayer();
      return;
    }

    // Check if the card is a +2 or +4, else return false
    switch (card.type) {
      case SpecialCardType.drawTwo:
        cardsToDraw += 2;

        break;
      case SpecialCardType.drawFour:
        cardsToDraw += 4;

        final choosenColor = await colorChooserDialog();
        storedCards.last.color = choosenColor;

        break;
      default:
        // Handle cards to draw
        if (cardsToDraw > 0) {
          // Add `cardsToDraw` to the player
          addRandomCardToPlayer(player, count: cardsToDraw, notify: false);
          cardsToDraw = 0;

          nextPlayer();
          return;
        }
    }

    nextPlayer();
    return;
  }

  /// Show a color chooser dialog and let the user choose a color
  Future<CardColor> colorChooserDialog() async {
    CardColor? returnColor;

    await Get.dialog(
      AlertDialog(
        title: const Text("Change color"),
        actions: [
          IconButton(
            onPressed: () {
              returnColor = CardColor.red;
              Get.back();
            },
            icon: const Icon(
              Icons.circle,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              returnColor = CardColor.blue;
              Get.back();
            },
            icon: const Icon(
              Icons.circle,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              returnColor = CardColor.yellow;
              Get.back();
            },
            icon: const Icon(
              Icons.circle,
              color: Colors.yellow,
            ),
          ),
          IconButton(
            onPressed: () {
              returnColor = CardColor.green;
              Get.back();
            },
            icon: const Icon(
              Icons.circle,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );

    return returnColor ??
        (storedCards.isNotEmpty ? storedCards.last.color : CardColor.red);
  }
}
