import 'package:flutter/material.dart';
import 'package:maps_imagens/models/place.dart';

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
}
