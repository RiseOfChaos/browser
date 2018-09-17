import 'dart:html';
import 'package:nuts/nuts.dart';
import 'package:nuts/html_renderer.dart';

import 'package:web_client/models/city/city.dart';
import 'package:web_client/ui/city_map/city_map.dart';

void main() {
  City city;
  var tiles = RxList<CityTile>(400);

  for (int i = 0; i < ICity.totalSlots; i++) {
    tiles[i] = CityResourceTile()
      ..setData(city, i % ICity.numCols, i ~/ ICity.numCols, 0);
  }
  tiles[22] = null;

  city = City()
    ..name = "First city"
    ..tiles = tiles;

  var cityView = CityMapView(city, CityMapViewSettings());
  Element e = defaultRenderers.render(cityView);
  document.body.children = [e];
}
