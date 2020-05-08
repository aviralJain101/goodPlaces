import 'dart:io';
import 'package:flutter/material.dart';
import 'package:good_places/provider/good_places.dart';
import 'package:good_places/widgets/image_input.dart';
import 'package:good_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place'; 
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage; 
  void  _selectedImage(File pickedImage){
    _pickedImage=pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty||_pickedImage==null){return;}
    Provider.of<GoodPlaces>(context).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: _titleController,
                      ),
                      SizedBox(height: 20,),
                      ImageInput(_selectedImage),
                      SizedBox(height: 10,),
                      LocationInput(),
                    ],
                  ),
                )
            ),
          ),
          RaisedButton.icon(
            onPressed: _savePlace ,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}