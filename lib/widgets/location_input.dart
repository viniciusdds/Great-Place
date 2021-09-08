import 'package:flutter/material.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticMapImageUrl =  LocationUtil.generateLocationPreviewImage(
      latitude: 37.419857,
      longitude: -122.078827,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
     final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) => MapScreen()
      )
    );

     if(selectedLocation == null){
       return;
     }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            )
          ),
          child: _previewImageUrl == null ?
           Text('Localização não informada!')
          : Image.network(
            _previewImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.location_on),
                  label: Text(
                      'Localização Atual',
                    style: TextStyle(
                        fontSize: 10
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Theme.of(context).primaryColor
                  ),
                  onPressed: _getCurrentUserLocation,
                ),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.map),
                  label: Text(
                      'Selecione o Mapa',
                    style: TextStyle(
                      fontSize: 10
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Theme.of(context).primaryColor,
                  ),
                  onPressed: _selectOnMap,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
