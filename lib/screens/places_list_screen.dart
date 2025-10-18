import 'package:flutter/material.dart';
import 'package:maps_imagens/provider/greate_places.dart';
import 'package:maps_imagens/utilis/app_rotas.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Viagens'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRotas.placeForm);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: const Center(child: Text("Nenhum Local cadastrado!")),
        builder: (context, greatePlaces, ch) => greatePlaces.itemsCount == 0
            ? ch!
            : ListView.builder(
                itemCount: greatePlaces.itemsCount,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatePlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(greatePlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
