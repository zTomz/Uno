import 'dart:math';

import 'package:flutter/material.dart';

abstract class GameCard {
  CardColor color;

  GameCard({
    required this.color,
  });

  Color getColor() {
    switch (color) {
      case CardColor.red:
        return Colors.red;
      case CardColor.green:
        return Colors.green;
      case CardColor.blue:
        return Colors.blue;
      case CardColor.yellow:
        return Colors.yellow;
    }
  }

  static GameCard randomCard() {
    return Random().nextBool()
        ? DefaultCard.randomCard()
        : SpecialCard.randomCard();
  }

  static String cardColorToString(CardColor color) {
    switch (color) {
      case CardColor.red:
        return "Red";
      case CardColor.green:
        return "Green";
      case CardColor.blue:
        return "Blue";
      case CardColor.yellow:
        return "Yellow";
    }
  }

  static String specialCardTypeToString(SpecialCardType type) {
    switch (type) {
      case SpecialCardType.reverse:
        return "Reverse";
      case SpecialCardType.skip:
        return "Skip";
      case SpecialCardType.drawTwo:
        return "Draw Two";
      case SpecialCardType.drawFour:
        return "Draw Four";
      case SpecialCardType.changeColor:
        return "Change Color";
    }
  }

  Widget display();

  List<GameCard> randomCards({int count = 1});

  static TextStyle get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      );
}

/// Represents a normal Uno card
///
/// Each card has a `value` `[0-9]` and a `color` `[red, green, blue, yellow]`
class DefaultCard extends GameCard {
  final int value;

  DefaultCard({
    required this.value,
    required super.color,
  });

  @override
  String toString() {
    return 'GameCard{value: $value, color: $color}';
  }

  /// Returns a card with a random number and random color
  DefaultCard.randomCard()
      : value = Random().nextInt(10),
        super(
          color: CardColor.values[Random().nextInt(CardColor.values.length)],
        );

  @override
  Widget display() {
    return Text(
      value.toString(),
      style: GameCard.textStyle,
      textAlign: TextAlign.center,
    );
  }

  @override
  List<GameCard> randomCards({int count = 1}) {
    List<GameCard> cards = [];

    for (int i = 0; i < count; i++) {
      cards.add(DefaultCard.randomCard());
    }

    return cards;
  }
}

class SpecialCard extends GameCard {
  final SpecialCardType type;

  SpecialCard({
    required this.type,
    required super.color,
  });

  SpecialCard.randomColor(SpecialCardType cardType)
      : type = cardType,
        super(
          color: CardColor.values[Random().nextInt(CardColor.values.length)],
        );

  SpecialCard.randomCard()
      : type = SpecialCardType
            .values[Random().nextInt(SpecialCardType.values.length)],
        super(
          color: CardColor.values[Random().nextInt(CardColor.values.length)],
        );

  @override
  Widget display() {
    switch (type) {
      case SpecialCardType.reverse:
        return const Icon(
          Icons.swap_horiz_rounded,
          color: Colors.black,
          size: 40,
        );
      case SpecialCardType.skip:
        return const Icon(
          Icons.skip_next_rounded,
          color: Colors.black,
          size: 40,
        );
      case SpecialCardType.drawTwo:
        return Text(
          '+2',
          style: GameCard.textStyle,
          textAlign: TextAlign.center,
        );
      case SpecialCardType.drawFour:
        return Text(
          '+4',
          style: GameCard.textStyle,
          textAlign: TextAlign.center,
        );
      case SpecialCardType.changeColor:
        return const Icon(
          Icons.refresh_rounded,
          color: Colors.black,
          size: 40,
        );
    }
  }

  @override
  List<GameCard> randomCards({int count = 1}) {
    List<GameCard> cards = [];

    for (int i = 0; i < count; i++) {
      cards.add(SpecialCard.randomCard());
    }

    return cards;
  }
}

enum SpecialCardType {
  reverse,
  skip,
  drawTwo,
  drawFour,
  changeColor,
}

enum CardColor {
  red,
  green,
  blue,
  yellow,
}
