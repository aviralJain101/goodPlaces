import 'package:flutter/material.dart';
import 'package:good_places/provider/good_places.dart';
import 'package:good_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed:(){
            Navigator.pushNamed(context, AddPlaceScreen.routeName);
          })
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GoodPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (context, data)=>data.connectionState==ConnectionState.waiting ? 
        Center(child: CircularProgressIndicator(),) :
        Consumer<GoodPlaces>(
          child: Center(child: Text('Add Places'),),
          builder: (context, data, child)=>data.items.length==0 ? child :
          ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, i)=>ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(data.items[i].image),
              ),
              title: Text(data.items[i].title),
              onTap: (){},
            ),
          ),
        ),
      ),
    );
  }
}