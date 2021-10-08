class PlaceSearch {
  PlaceSearch({this.description, this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
        description: json['description'] as String,
        placeId: json['place_id'] as String);
  }
  final String description;
  final String placeId;
}
