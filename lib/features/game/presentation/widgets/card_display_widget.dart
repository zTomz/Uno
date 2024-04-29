import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uno/features/game/data/models/card.dart';
import 'package:uno/features/game/presentation/widgets/card_widget.dart';

class CardDisplay extends StatelessWidget {
  final List<GameCard> cards;
  final void Function(GameCard card)? onTap;
  final double overlayWidth;

  const CardDisplay({
    super.key,
    required this.cards,
    this.onTap,
    this.overlayWidth = 60,
  });

  @override
  Widget build(BuildContext context) {
    int iteration = 0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: CardWidget.cardHeight + 10,
        width:
            cards.length * overlayWidth + (CardWidget.cardWidth - overlayWidth),
        child: Stack(
          children: cards.map(
            (card) {
              String tooltip = "";

              if (card is DefaultCard) {
                tooltip = " ${card.color.name} ${card.value}";
              } else if (card is SpecialCard) {
                tooltip = card.type.name;
              }

              return Positioned(
                left: iteration++ * overlayWidth,
                top: Random().nextInt(10).toDouble(),
                child: CardWidget(
                  backgroundColor: card.color.color,
                  textColor: Colors.black,
                  tooltip: tooltip,
                  onTap: () {
                    if (onTap != null) {
                      onTap!(card);
                    }
                  },
                  child: card.display(),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
