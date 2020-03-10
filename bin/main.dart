import 'dart:io';
import 'dart:convert';
import 'package:adventure/shelf.dart';

void main(List<String> arguments) {
  final str1 = File(arguments[0]).readAsStringSync();
  final Map map1 = json.decode(str1);
  final planets = new List<Planet>();
  map1['planets'].forEach( (e) => planets.add(Planet(name:e['name'], description:e['description'])) );

  final planetarySystem = PlanetarySystem(name: map1['name'], planets:planets);
  final adventure = SpaceAdventure(planetarySystem: planetarySystem);
  adventure.start();
  
}
