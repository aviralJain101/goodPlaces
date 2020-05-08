import 'package:flutter/material.dart';
import 'package:good_places/provider/good_places.dart';
import 'package:good_places/screens/add_place_screen.dart';
import 'package:good_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GoodPlaces(),
      child: MaterialApp(
        title: 'Good Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ct)=>AddPlaceScreen(),
        },
      ),
    );
  }
}