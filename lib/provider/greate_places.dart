import 'dart:io';
import 'package:flutter/material.dart';
import 'package:maps_imagens/models/place.dart';
import 'dart:math';

class GreatePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items]; // Não retorna diretamente a lista
  }

  int get itemsCount {
    return _items.length; // Os itens virão para este trecho
  }

  Place itemByIndex(int index) {
    return _items[index]; // Os dados retornarão pelo id
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      location: null,
      image: image,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
