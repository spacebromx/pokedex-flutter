import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

class Pokemon {
  Future<dynamic> getList() async {
    List<dynamic> pokemonList = [];

    http.Response response = await http.get('$kApiUrl?limit=15');

    if (response.statusCode == 200) {
      pokemonList = json.decode(response.body)['results'];
    } else {
      throw ('An error occurred');
    }

    return pokemonList;
  }

  Future<dynamic> getPokemonData(int pokemonId) async {
    var data;
    http.Response response = await http.get('$kApiUrl/$pokemonId');

    if (response.statusCode == 200) {
      data = json.decode(response.body);
    } else {
      throw ('Error');
    }

    return data;
  }
}
