import 'package:flutter/widgets.dart';

import 'package:geolocator/geolocator.dart';

import 'package:ukulimabora/Infrustracture/Models/places_search.dart';
import 'package:ukulimabora/Infrustracture/Services/geolocator_service.dart';
import 'package:ukulimabora/Infrustracture/Services/places_service.dart';
import 'package:ukulimabora/Infrustracture/Services/weather_service.dart';

class ApplicationBloc with ChangeNotifier {
  ApplicationBloc() {
    setCurrentLocation();
    getWeather();
  }

  final GeolocatorService geolocatorService = GeolocatorService();
  final PlacesService placesService = PlacesService();
  final WeatherForcast weatherForcast = WeatherForcast();

  Position currentLocation;
  List<PlaceSearch> searchResults;
  Map<String, dynamic> weather;

  Future<Position> setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
    return currentLocation;
  }

  Future<List<PlaceSearch>> searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
    return searchResults;
  }

  Future<Map<String, dynamic>> getWeather() async {
    weather = await weatherForcast.getWeather();
    notifyListeners();
    return weather;
  }
}
