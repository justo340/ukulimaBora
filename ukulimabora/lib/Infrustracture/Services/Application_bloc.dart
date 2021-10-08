import 'package:flutter/widgets.dart';

import 'package:geolocator/geolocator.dart';

import 'package:ukulimabora/Infrustracture/Models/places_search.dart';
import 'package:ukulimabora/Infrustracture/Services/geolocator_service.dart';
import 'package:ukulimabora/Infrustracture/Services/places_service.dart';

class ApplicationBloc with ChangeNotifier {
  ApplicationBloc() {
    setCurrentLocation();
  }

  final GeolocatorService geolocatorService = GeolocatorService();
  final PlacesService placesService = PlacesService();

  Position currentLocation;
  List<PlaceSearch> searchResults;

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
}
