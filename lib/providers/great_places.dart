import 'dart:io';

import 'package:flutter/foundation.dart';
import '../helpers/db_helpers.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _items = [];
  List<Places> get items {
    return [..._items];
  }

//  Ajout de places
  void addPlace(
    String pickedTilte,
    File? pickedImage,
  ) {
    final newPlace = Places(
      id: DateTime.now().toString(),
      title: pickedTilte,
      location: null,
      image: pickedImage!,
    );
    _items.add(newPlace);
    notifyListeners();
    //  INSERER LES DONNEES DANS LA BASE LOCALE
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  //  RECUPERE LES DONNEES DANS LA BASE LOCAL
  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Places(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
