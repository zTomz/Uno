import 'package:uno/models/card.dart';

class Player {
  /// The cards of the player
  final List<GameCard> cards = [];
  /// The id of the player
  int id;
  /// The player name - is optional
  String? name;
  /// Is the player crazy - like in uno saying "Uno"
  bool saidCrazy = false;

  Player({
    required this.id,
    this.name,
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

  /// Set the name of the player
  void setName(String name) {
    this.name = name;
  }
}
