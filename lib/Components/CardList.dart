import 'package:flutter/material.dart';
import 'package:investmentmanager/Components/CardView.dart';
import 'package:investmentmanager/Model/CardModel.dart';
import 'package:investmentmanager/screens/CardViewPage.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal, children: getChaildrenCards(context));
  }

  List<Widget> getChaildrenCards(context) {
    return cards
        .map((card) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardViewPage(card: card)));
              },
              child: CardView(card),
            ))
        .toList();
  }
}
