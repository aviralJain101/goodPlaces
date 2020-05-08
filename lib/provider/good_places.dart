import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:good_places/helpers/db_helper.dart';
import 'package:good_places/models/place.dart';

class GoodPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  void addPlace(String title, File image){
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: title,
      image: image,
      location: null
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((i)=>Place(
      id: i['id'],
      title: i['title'],
      image: File(i['image']),
      location: null
    )).toList();
    notifyListeners();
  }
}