import 'package:flutter/material.dart';
import 'package:maps/screens/add_place.dart';
import './providers/great_places.dart';
import './screens/place_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Mapping',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
        ),
        home: PlaceList(),
        routes: {
          AddPlaces.routeName: (ctx) => AddPlaces(),
        },
      ),
    );
  }
}
