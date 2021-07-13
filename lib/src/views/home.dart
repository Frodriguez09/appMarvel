import 'package:flutter/material.dart';
import 'package:marvel_app/src/models/personajes_model.dart';
import 'package:marvel_app/src/search/search_delegate.dart';
import 'package:marvel_app/src/providers/personaje_provider.dart';
import 'package:marvel_app/src/views/widgets/character_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CharacterModel> _character;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getHeroes();
  }

  Future<void> getHeroes() async {
    _character = await CharacterApi.getHeroes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Biblioteca Marvel'), actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataDelegate());
            },
          )
        ]),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _character.length,
                itemBuilder: (context, index) {
                  return CharacterCard(hero: _character[index]);
                },
              ));
  }
}
