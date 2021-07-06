import 'package:dio/dio.dart';
import 'package:marvel_app/src/models/personajes_model.dart';

class PersonajeProvider {
  final _url =
      'https://gateway.marvel.com:443/v1/public/characters?ts=1&orderBy=name&apikey=b7a0605ea782fa89df24d486ee8f8bca&hash=3553b437689f5f8471dcf4c6c3bdb823';
  final _http = Dio();

  Future<List<CharacterModel>> getCharacters() async {
    final response = await _http.get(_url);
    List<dynamic> data = response.data['results'];
    return data
        .map((character) => CharacterModel.fromJsonCharacter(character))
        .toList();
  }
}
