import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:marvel_app/src/models/personajes_model.dart';

class CharacterApi {
  String _apiKey = "b7a0605ea782fa89df24d486ee8f8bca";
  String _hash = "3553b437689f5f8471dcf4c6c3bdb823";
  String _url = "gateway.marvel.com";
  String _ts = "1";
  String _limit = "2";

  Future<List<CharacterModel>> _getRequest(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    List _temp = [];

    for (var i in decodedData['data']['results']) {
      i['thumbnail']['path'] =
          i['thumbnail']['path'] + '.' + i['thumbnail']['extension'];
      _temp.add(i);
    }

    return CharacterModel.characterFromSnapshot(_temp);
  }

  static Future<List<CharacterModel>> getHeroes() async {
    String _apiKey = "b7a0605ea782fa89df24d486ee8f8bca";
    String _hash = "3553b437689f5f8471dcf4c6c3bdb823";
    String _url = "gateway.marvel.com";
    String _ts = "1";

    final url = Uri.https(_url, '/v1/public/characters', {
      "ts": _ts,
      "apikey": _apiKey,
      "hash": _hash,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    List _temp = [];

    for (var i in decodedData['data']['results']) {
      i['thumbnail']['path'] =
          i['thumbnail']['path'] + '.' + i['thumbnail']['extension'];
      _temp.add(i);
    }

    return CharacterModel.characterFromSnapshot(_temp);
  }

  Future<List<CharacterModel>> searchHeroes(String query) async {
    final url = Uri.https(_url, '/v1/public/characters', {
      'name': query,
      "ts": _ts,
      'apikey': _apiKey,
      "hash": _hash,
    });

    return await _getRequest(url);
  }
}
