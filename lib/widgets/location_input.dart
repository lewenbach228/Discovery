import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'Aucune location choisi!',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(
                Icons.location_on,
              ),
              label: Text(
                'Localisation ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map,
              ),
              label: Text(
                'Localisation',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
