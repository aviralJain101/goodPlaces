import 'dart:io';
class PlaceLocation{
  final double lattitude;
  final double longitude;
  final String address;

  PlaceLocation({this.lattitude, this.longitude, this.address});
}
class Place{
  String id;
  String title;
  final PlaceLocation location;
  final File image;
  Place({this.id,this.title,this.location,this.image});
}