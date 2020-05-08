const GOOGLE_API_KEY = 'AIzaSyDWrCcN5NBZxXsEXccvo5f4w182XjcOogg';

class LocationHelper{
  static String generateLocationPreviewImage({double lat, double long}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$long&=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
}