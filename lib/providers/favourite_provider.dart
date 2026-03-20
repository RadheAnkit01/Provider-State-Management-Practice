import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  final List<String> _fruits = [
    'Apple',
    'Apricot',
    'Avocado',
    'Banana',
    'Blackberry',
    'Blueberry',
    'Cherry',
    'Coconut',
    'Date',
    'Dragon Fruit',
    'Fig',
    'Grape',
    'Guava',
    'Kiwi',
    'Lemon',
    'Lychee',
    'Mango',
    'Melon',
    'Orange',
    'Papaya',
    'Peach',
    'Pear',
    'Pineapple',
    'Plum',
    'Pomegranate',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];
  final List<String> _favItems = [];

  List<String> get allFruits => _fruits;
  List<String> get favFruits => _favItems;

  // add data
  void addToFav(String data) {
    _favItems.add(data);
    notifyListeners();
  }

  // remove data
  void removeFromFav(String data) {
    _favItems.remove(data);
    notifyListeners();
  }
}
