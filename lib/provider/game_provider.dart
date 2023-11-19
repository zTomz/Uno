import 'package:flutter/material.dart';
import 'package:uno/models/card.dart';
import 'package:uno/models/player.dart';

class Game extends ChangeNotifier {
  final List<Player> players = [];
  List<GameCard> storedCards = [];
  int currentPlayer = 0;

  /// Initialize the game
  void init({int playerCount = 2, int cardCount = 7}) {
    players.clear();
    storedCards.clear();
    currentPlayer = 0;

    for (int i = 0; i < playerCount; i++) {
      players.add(Player(id: i));
    }

    for (int i = 0; i < cardCount; i++) {
      for (Player player in players) {
        player.addCard(DefaultCard.randomCard());
      }
    }

    notifyListeners();
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
    currentPlayer = (currentPlayer + 1) % players.length;

    notifyListeners();
  }

  /// Change the current player to the previous player
  void previousPlayer() {
    currentPlayer = (currentPlayer - 1) % players.length;

    notifyListeners();
  }

  /// Get the current player
  Player getCurrentPlayer() {
    return players[currentPlayer];
  }

  /// Get the next player
  Player getNextPlayer() {
    return players[(currentPlayer + 1) % players.length];
  }

  /// Add a card to the current player
  void addCardToPlayer(Player player, GameCard card, {bool notify = false}) {
    player.addCard(card);

    if (notify) {
      notifyListeners();
    }
  }

  /// Place a card
  void placeCard(Player player, GameCard card) {
    if (cardCanBePlaced(card)) {
      storedCards.add(card);
      player.removeCard(card);

      if (card is SpecialCard) {
        // TODO: Handle special card
      }

      // No need to notify listeners here, `nextPlayer` will call `notifyListeners`
      nextPlayer();
    }
  }

  bool cardCanBePlaced(GameCard card) {
    // If the stored box is empty, any card can be placed
    if (storedCards.isEmpty) {
      return true;
    }

    // If the color of both cards match, the card can be placed
    if (storedCards.last.color == card.color) {
      return true;
    }

    // If the value of both cards match, the card can be placed
    if (card is DefaultCard &&
        (storedCards.last as DefaultCard).value == card.value) {
      return true;
    }

    // If the type of both cards match, the card can be placed
    if (card is SpecialCard &&
        (storedCards.last as SpecialCard).type == card.type) {
      return true;
    }

    return false;
  }
}
