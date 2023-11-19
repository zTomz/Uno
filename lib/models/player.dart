import 'package:uno/models/card.dart';

class Player {
  final List<GameCard> cards = [];
  int id;

  Player({
    required this.id,
  });

  void addCard(GameCard card) {
    cards.add(card);
  }

  void removeCard(GameCard card) {
    cards.remove(card);
  }
}
