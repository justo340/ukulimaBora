import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:ukulimabora/Infrustracture/Models/places_search.dart';
import 'package:ukulimabora/Shared/Common/keys.dart';

class PlacesService {
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$googlePlaceskey&components=country:ke');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final dynamic json = convert.jsonDecode(response.body);
      if (json['status'] == 'OK') {
        final List<dynamic> jsonResults = json['predictions'] as List<dynamic>;

        // return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
      }
      if (json['status'] == 'ZERO_RESULTS') {
        return <PlaceSearch>[];
      }
      throw Exception(json['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
