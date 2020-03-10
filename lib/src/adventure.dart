import 'dart:io';
import 'planetary_system.dart';

class SpaceAdventure{
  PlanetarySystem planetarySystem;
  SpaceAdventure({this.planetarySystem});

  void start(){
    printGreeting();
    printIntro(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    travel();
  }

  void travel(){
    String ans;
    while(ans != 'Y' && ans != 'N'){
      ans = responseToPrompt('Shall I randomly choose a planet for you to visit? (Y or N)');
      if(ans == 'Y'){
        travelToRandomPlanet();
      }
      else if(ans == 'N'){
        travelToSpecificPlanet(responseToPrompt('Name the planet you would like to visit.'));
      }
      else{
        print('Sorry, I didn\'t get that.');
      }
    }
  }

  void travelToRandomPlanet(){
    final planet = planetarySystem.randomPlanet();
    print('Travelling to ${planet.name} ...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travelToSpecificPlanet(String planetName){
    final planet = planetarySystem.specificPlanet(planetName);
    print('Travelling to ${planet.name} ...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void printGreeting(){
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  void printIntro(String name){
    print('Nice to meet you ${name}. My name is Eliza, I\'m an old friend of Alexa.');
  }

  String responseToPrompt(String prompt){
    print(prompt);
    return stdin.readLineSync();
  }
}
