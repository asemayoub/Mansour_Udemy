import 'package:flutter/material.dart';

abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}
class NewsButtomNavState extends NewsAppStates {}


// Data Business Section

class NewsGetBusinessSuccess extends NewsAppStates{}
class NewsGetBusinessErorr extends NewsAppStates{

  late final String erorr;

  NewsGetBusinessErorr(this.erorr);

}
class NewsGetBusinessLodaing extends NewsAppStates{}

// Data Sports Section

class NewsGetSportsSuccess extends NewsAppStates{}
class NewsGetSportsErorr extends NewsAppStates{

  late final String erorr;

  NewsGetSportsErorr(this.erorr);

}
class NewsGetSportsLodaing extends NewsAppStates{}

// Data Since Section

class NewsGetSinceSuccess extends NewsAppStates{}
class NewsGetSinceErorr extends NewsAppStates{

  late final String erorr;

  NewsGetSinceErorr(this.erorr);

}
class NewsGetSinceLodaing extends NewsAppStates{}
