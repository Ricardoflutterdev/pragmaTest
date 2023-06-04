import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  String _imperial = "";
  String _metric = "";
  String _id = "";
  String _name = "";
  String _cfaUrl = "";
  String _vetstreetUrl = "";
  String _vcahospitalsUrl = "";
  String _temperament = "";
  String _origin = "";
  String _countryCodes = "";
  String _countryCode = "";
  String _description = "";
  String _lifeSpan = "";
  int _indoor = 0;
  int _lap = 0;
  String _altNames = "";
  int _adaptability = 0;
  int _affectionLevel = 0;
  int _childFriendly = 0;
  int _dogFriendly = 0;
  int _energyLevel = 0;
  int _grooming = 0;
  int _healthIssues = 0;
  int _intelligence = 0;
  int _sheddingLevel = 0;
  int _socialNeeds = 0;
  int _strangerFriendly = 0;
  int _vocalisation = 0;
  int _experimental = 0;
  int _hairless = 0;
  int _natural = 0;
  int _rare = 0;
  int _rex = 0;
  int _suppressedTail = 0;
  int _shortLegs = 0;
  String _wikipediaUrl = "";
  int _hypoallergenic = 0;
  String _referenceImageId = "";
  int _catFriendly = 0;
  int _bidability = 0;

  String get imperial {
    return _imperial;
  }

  set imperial(String newValue) {
    _imperial = newValue;
  }

  String get metric {
    return _metric;
  }

  set metric(String newValue) {
    _metric = newValue;
  }

  String get id {
    return _id;
  }

  set id(String newValue) {
    _id = newValue;
  }

  String get name {
    return _name;
  }

  set name(String newValue) {
    _name = newValue;
  }

  String get cfaUrl {
    return _cfaUrl;
  }

  set cfaUrl(String newValue) {
    _cfaUrl = newValue;
  }

  String get vetstreetUrl {
    return _vetstreetUrl;
  }

  set vetstreetUrl(String newValue) {
    _vetstreetUrl = newValue;
  }

  String get vcahospitalsUrl {
    return _vcahospitalsUrl;
  }

  set vcahospitalsUrl(String newValue) {
    _vcahospitalsUrl = newValue;
  }

  String get temperament {
    return _temperament;
  }

  set temperament(String newValue) {
    _temperament = newValue;
  }

  String get origin {
    return _origin;
  }

  set origin(String newValue) {
    _origin = newValue;
  }

  String get countryCodes {
    return _countryCodes;
  }

  set countryCodes(String newValue) {
    _countryCodes = newValue;
  }

  String get countryCode {
    return _countryCode;
  }

  set countryCode(String newValue) {
    _countryCode = newValue;
  }

  String get description {
    return _description;
  }

  set description(String newValue) {
    _description = newValue;
  }

  String get lifeSpan {
    return _lifeSpan;
  }

  set lifeSpan(String newValue) {
    _lifeSpan = newValue;
  }

  int get indoor {
    return _indoor;
  }

  set indoor(int newValue) {
    _indoor = newValue;
  }

  int get lap {
    return _lap;
  }

  set lap(int newValue) {
    _lap = newValue;
  }

  String get altNames {
    return _altNames;
  }

  set altNames(String newValue) {
    _altNames = newValue;
  }

  int get adaptability {
    return _adaptability;
  }

  set adaptability(int newValue) {
    _adaptability = newValue;
  }

  int get affectionLevel {
    return _affectionLevel;
  }

  set affectionLevel(int newValue) {
    _affectionLevel = newValue;
  }

  int get childFriendly {
    return _childFriendly;
  }

  set childFriendly(int newValue) {
    _childFriendly = newValue;
  }

  int get dogFriendly {
    return _dogFriendly;
  }

  set dogFriendly(int newValue) {
    _dogFriendly = newValue;
  }

  int get energyLevel {
    return _energyLevel;
  }

  set energyLevel(int newValue) {
    _energyLevel = newValue;
  }

  int get grooming {
    return _grooming;
  }

  set grooming(int newValue) {
    _grooming = newValue;
  }

  int get healthIssues {
    return _healthIssues;
  }

  set healthIssues(int newValue) {
    _healthIssues = newValue;
  }

  int get intelligence {
    return _intelligence;
  }

  set intelligence(int newValue) {
    _intelligence = newValue;
  }

  int get sheddingLevel {
    return _sheddingLevel;
  }

  set sheddingLevel(int newValue) {
    _sheddingLevel = newValue;
  }

  int get socialNeeds {
    return _socialNeeds;
  }

  set socialNeeds(int newValue) {
    _socialNeeds = newValue;
  }

  int get strangerFriendly {
    return _strangerFriendly;
  }

  set strangerFriendly(int newValue) {
    _strangerFriendly = newValue;
  }

  int get vocalisation {
    return _vocalisation;
  }

  set vocalisation(int newValue) {
    _vocalisation = newValue;
  }

  int get experimental {
    return _experimental;
  }

  set experimental(int newValue) {
    _experimental = newValue;
  }

  int get hairless {
    return _hairless;
  }

  set hairless(int newValue) {
    _hairless = newValue;
  }

  int get natural {
    return _natural;
  }

  set natural(int newValue) {
    _natural = newValue;
  }

  int get rare {
    return _rare;
  }

  set rare(int newValue) {
    _rare = newValue;
  }

  int get rex {
    return _rex;
  }

  set rex(int newValue) {
    _rex = newValue;
  }

  int get suppressedTail {
    return _suppressedTail;
  }

  set suppressedTail(int newValue) {
    _suppressedTail = newValue;
  }

  int get shortLegs {
    return _shortLegs;
  }

  set shortLegs(int newValue) {
    _shortLegs = newValue;
  }

  String get wikipediaUrl {
    return _wikipediaUrl;
  }

  set wikipediaUrl(String newValue) {
    _wikipediaUrl = newValue;
  }

  int get hypoallergenic {
    return _hypoallergenic;
  }

  set hypoallergenic(int newValue) {
    _hypoallergenic = newValue;
  }

  String get referenceImageId {
    return _referenceImageId;
  }

  set referenceImageId(String newValue) {
    _referenceImageId = newValue;
  }

  int get catFriendly {
    return _catFriendly;
  }

  set catFriendly(int newValue) {
    _catFriendly = newValue;
  }

  int get bidability {
    return _bidability;
  }

  set bidability(int newValue) {
    _bidability = newValue;
  }

}
