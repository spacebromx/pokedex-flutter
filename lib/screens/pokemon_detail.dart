import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

class PokemonDetail extends StatelessWidget {
  final data;

  PokemonDetail({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex - ${data['name']}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '#${data['id']}',
            style: kPokemonNameStyle,
          ),
          Text(data['name'], style: kPokemonNameStyle),
          Image.network(
            data['sprites']['front_default'],
          ),
          Text(
            'Height: ${data['height']}',
            style: kFactsStyle,
          ),
          Text(
            'Weight: ${data['weight']}',
            style: kFactsStyle,
          )
        ],
      ),
    );
  }
}
