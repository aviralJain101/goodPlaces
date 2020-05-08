import 'package:flutter/material.dart';
import 'package:good_places/helpers/location_helper.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _priewImageUrl;
  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = 
      LocationHelper.generateLocationPreviewImage(lat: locData.latitude, long: locData.longitude);
    setState(() {
      _priewImageUrl=staticMapImageUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey)
          ),
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _priewImageUrl==null?Center(child: Text('No Location chosen'),):
            Image.network(_priewImageUrl,fit: BoxFit.cover,width: double.infinity,),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Use current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select On Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: (){},
            ),
          ],
        )
      ],
    );
  }
}