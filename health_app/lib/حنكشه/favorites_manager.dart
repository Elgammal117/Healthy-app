import 'package:flutter/material.dart';

class FavoritesManager extends ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(Map<String, String> food) {
    if (_favorites.any((item) => item["name"] == food["name"])) {
      _favorites.removeWhere((item) => item["name"] == food["name"]);
    } else {
      _favorites.add(food);
    }
    notifyListeners();
  }

  bool isFavorite(String name) {
    return _favorites.any((item) => item["name"] == name);
  }
}
