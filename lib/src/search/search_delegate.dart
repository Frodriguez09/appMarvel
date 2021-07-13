import 'package:flutter/material.dart';
import 'package:marvel_app/src/providers/personaje_provider.dart';
import 'package:marvel_app/src/models/personajes_model.dart';

class DataDelegate extends SearchDelegate {
  final recipeapi = new CharacterApi();

  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Container(
      height: 100.0,
      width: 150.0,
      color: Colors.blueAccent,
      child: Text(seleccion),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: recipeapi.searchHeroes(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<CharacterModel>> snapshot) {
        if (snapshot.hasData) {
          final hero = snapshot.data;
          return ListView(
            children: hero.map((hero) {
              return ListTile(
                leading: FadeInImage(
                    image: NetworkImage(hero.images),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain),
                title: Text(hero.name),
                onTap: () {
                  close(context, null);
                  Navigator.pushNamed(context, 'detalle', arguments: hero);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
