import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_detail.dart';
import 'pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: Index(),
    );
  }
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Pokemon pokemon = Pokemon();
  List<dynamic> pokemonList = [];
  var pokemonData;

  getPokemonList() async {
    pokemonList = await pokemon.getList();
  }

  List<Widget> getPokemonCards() {
    List<Widget> cards = [];

    for (int i = 0; i < pokemonList.length; i++) {
      cards.add(
        FlatButton(
          onPressed: () async {
            pokemonData = await pokemon.getPokemonData(i + 1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonDetail(
                  data: pokemonData,
                ),
              ),
            );
          },
          child: Card(
            child: ListTile(
              leading: Text('${i + 1}'),
              trailing: Icon(Icons.arrow_right),
              title: Text(
                pokemonList[i]['name'],
              ),
            ),
          ),
        ),
      );
    }

    return cards;
  }

  @override
  void initState() {
    super.initState();
    getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: ListView(
        children: getPokemonCards(),
      ),
    );
  }
}
