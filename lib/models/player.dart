import 'package:uno/models/card.dart';

class Player {
  /// The cards of the player
  final List<GameCard> cards = [];
  /// The id of the player
  int id;

  Player({
    required this.id,
  });

  /// Add a card to the player
  void addCard(GameCard card) {
    cards.add(card);
  }

  /// Add multiple cards to the player
  void addCards(List<GameCard> cards) {
    this.cards.addAll(cards);
  }

  /// Remove a card from the player
  void removeCard(GameCard card) {
    cards.remove(card);
  }
}
