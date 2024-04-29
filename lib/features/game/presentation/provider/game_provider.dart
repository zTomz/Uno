import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno/features/game/data/models/card.dart';
import 'package:uno/features/game/data/models/game_direction.dart';
import 'package:uno/features/game/data/models/player.dart';

class GameProvider extends ChangeNotifier {
  final List<Player> players = [];
  List<GameCard> storedCards = [];
  int currentPlayer = 0;

  /// Direction the players change - 1 for next player, -1 for previous player
  GameDirection gameDirection = GameDirection.forward;

  /// A counter to keep track of the number of cards to draw
  ///
  /// Set to `0` by default, when a card is placed, it will check,
  /// if it is higher than 1, it will check if the choosen card is
  /// also a +2 or +4, else it will add it to the cards of the current
  /// player.
  int cardsToDraw = 0;

  /// Initialize the game and reset all variables
  void init({int playerCount = 2, bool notify = true, int cardCount = 7}) {
    players.clear();
    storedCards.clear();
    currentPlayer = 0;
    cardsToDraw = 0;
    gameDirection = GameDirection.initial;

    for (int i = 0; i < playerCount; i++) {
      players.add(Player(id: i));
    }

    for (int i = 0; i < players.length; i++) {
      addRandomCardToPlayer(players[i], count: cardCount, notify: false);
    }

    if (notify) {
      notifyListeners();
    }
  }

  /// Change the current player to the next player
  void nextPlayer() {
    currentPlayer = (currentPlayer + gameDirection.value) % players.length;

    notifyListeners();
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

    // Check for win
    if (player.cards.length == 1 && cardCanBePlaced(card)) {
      if (!player.saidCrazy) {
        // Player had not said crazy, so he gets a punishment
        // of 1 card
        addRandomCardToPlayer(player, count: 2, notify: false);
        player.saidCrazy = false;

        Get.showSnackbar(
          const GetSnackBar(
            title: "Crazy",
            message:
                "You got a punishment of 2 cards. You have to say 'crazy' when you have 1 card left.",
          ),
        );

        nextPlayer();
        return;
      }

      // Place the card
      storedCards.add(card);
      player.removeCard(card);

      notifyListeners();

      Get.showSnackbar(
        const GetSnackBar(
          title: "Crazy",
          message: "You won the game!",
        ),
      );

      await Future.delayed(const Duration(seconds: 3), () {
        Get.closeAllSnackbars();
        init();
      });
      return;
    }

    // Set player not said crazy
    player.saidCrazy = false;

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
          gameDirection = gameDirection.toggle();
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

    // Check if the card is a +2 or +4
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

  /// Set the player crazy, is like in uno saying "Uno"
  /// if `cardsToDraw` > 0, add a random card to the player
  /// as a punishment. Can only say "crazy" when 1 card is left
  bool setPlayerCrazy(Player player) {
    if (player.cards.length > 1) {
      addRandomCardToPlayer(player);

      return false;
    }

    player.saidCrazy = true;
    notifyListeners();

    return true;
  }
}
