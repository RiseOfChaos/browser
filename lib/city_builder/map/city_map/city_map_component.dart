import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

import 'package:data/city/city.dart';

import 'package:browser/city_builder/models/city.dart';
import 'package:browser/city_builder/models/tile.dart';

@Component(
  selector: 'city-map',
  styleUrls: ['city_map_component.css'],
  templateUrl: 'city_map_component.html',
  directives: [
    NgIf,
    NgFor,
  ],
)
class CityMapComponent {
  @Input()
  City city;

  int sizeIndex = 2;
  Point<int> get size => sizes[sizeIndex];

  List<CityResourceTile> resources = [];
  List<CityBuildingTile> buildings = [];

  void clicked(MouseEvent event) {
    if (event.target == viewportDiv) {
      selected = EmptyCityTile(
          city: city, x: event.offset.x ~/ size.x, y: event.offset.y ~/ size.y);
    }
  }

  void selectedClicked(MouseEvent event) {
    selected = null;
  }

  @ViewChild('viewport')
  DivElement viewportDiv;

  CityTile selected;

  void wheeled(WheelEvent event) {
    if (event.deltaY < 0) {
      if (sizeIndex < sizes.length - 1)
        sizeIndex++;
      else
        sizeIndex = sizes.length - 1;
    } else {
      if (sizeIndex > 0)
        sizeIndex--;
      else
        sizeIndex = 0;
    }
  }
}

const sizes = const <Point<int>>[
  Point<int>(64, 64),
  Point<int>(96, 96),
  Point<int>(128, 128),
];
