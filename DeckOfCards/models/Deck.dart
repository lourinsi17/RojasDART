import 'Card.dart';

class Deck {
  List<Card> _cards;
  Deck(this._cards);

  void printCards() {
    for (var card in _cards) {
      print("${card.value} of ${card.suit_name}");
    }
  }

  void shuffle() {
    _cards.shuffle();
    print('The cards have been shuffled');
  }

  Card _dummyCard = Card("XXXXXX", "XXXXXX"); //For wrong input
  Card? _findSuit(String suit_name) {
    Card? result = _cards.firstWhere((x) => suit_name == x.suit_name,
        orElse: () => _dummyCard);

    return result;
  }

  List<Card> cardsWithSuit(String suit_name) {
    List<Card> _suitfltCards = [];
    Card? suit = _findSuit(suit_name);

    if (suit != null && suit != _dummyCard) {
      for (var card in _cards) {
        if (card.suit_name == suit_name) {
          _suitfltCards.add(Card(card.suit_name, card.value));
        }
      }
      print('The deck has been filtered by suit: ${suit.suit_name}');
    } else {
      _suitfltCards.add(_dummyCard);
      print('$suit_name Card/Suit DOES NOT exists');
    }

    return _suitfltCards;
  }
}
