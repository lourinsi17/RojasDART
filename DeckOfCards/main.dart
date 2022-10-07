import 'models/Card.dart';
import 'models/Deck.dart';

List<Card> populateCards(List<Card> cards) {
  var values = [
    'Ace',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Jack',
    'Queen',
    'King'
  ];
  var suits = ['Clubs', 'Diamonds', 'Hearts', 'Spades'];

  for (var suit in suits) {
    for (var value in values) {
      cards.add(Card(suit, value));
    }
  }

  return cards;
}

void main() {
  List<Card> cards = <Card>[];

  Deck deck = Deck(populateCards(cards));
  deck.shuffle();
  print('---------Displaying Cards---------');
  deck.printCards();

  print('-----------------------');
  List<Card> suitedCards = deck.cardsWithSuit('Diamonds');
  Deck suitedDeck = Deck(suitedCards);
  suitedDeck.shuffle();
  print('---------Displaying Cards---------');
  suitedDeck.printCards();
}
