import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import '../screens/add_place.dart';
import 'package:provider/provider.dart';

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final greatPlace = Provider.of<GreatPlaces>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(' Places'),
      ),
      body: greatPlace.items.length <= 0
          ? Center(
              child: const Text('Aucune place disponible! Ajoutez-en une.'),
            )
          : FutureBuilder(
              future: Provider.of<GreatPlaces>(context, listen: false)
                  .fetchAndSetPlaces(),
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<GreatPlaces>(
                          builder: (ctx, greatPlaces, _) => ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                    greatPlaces.items[i].image,
                                  ),
                                ),
                                title: Text(greatPlaces.items[i].title),
                                onTap: () {
                                  // Go to detail page...
                                }),
                          ),
                        ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddPlaces.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
