import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'pk.eyJ1IjoiMjY1ODUxNSIsImEiOiJja3RnZ2RhcHQwaHloMm9ubWc4MGF5MDhvIn0.F_K1YaXtI128kpA37a2pBQ';

class LocationUtil {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/$longitude,$latitude,17.25,0,60/800x800?access_token=$GOOGLE_API_KEY';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    print(position.longitude.toString()+', '+position.latitude.toString());
    final url = Uri.parse('https://api.mapbox.com/geocoding/v5/mapbox.places/peets.json?proximity=${position.longitude},${position.latitude}&access_token=$GOOGLE_API_KEY');
    final response =  await http.get(url);
    return json.decode(response.body)['features'][0]['properties']['address'];
  }
}