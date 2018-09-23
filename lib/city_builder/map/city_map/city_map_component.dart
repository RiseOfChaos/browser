import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

import 'package:data/city/city.dart';

class Iso {
  static Point<int> fromOrtho(Point<num> ortho, Point<num> size) {
    int x = (ortho.x - ortho.y) * (size.x ~/ 2);
    int y = (ortho.x + ortho.y) * (size.y ~/ 4);
    return Point<int>(x, y);
  }

  static Point<int> toOrtho(Point<num> iso, Point<num> size) {
    int x = (iso.x / (size.x / 2) + iso.y / (size.y / 2)) ~/ 2;
    int y = (iso.y / (size.y / 2) - iso.x / (size.x / 2)) ~/ 2;
    return Point<int>(x, y);
  }
}

class Tile {
  int x;

  int y;

  String get color => 'blue';

  Tile({this.x: 0, this.y: 0});
}

Point<int> size = Point<int>(64, 64);

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
  int sizeIndex = 2;
  Point<int> get size => sizes[sizeIndex];

  List<Tile> tiles = [];

  void clicked(MouseEvent event) {
    if (event.target == viewportDiv) {
      selected = Tile(x: event.offset.x ~/ size.x, y: event.offset.y ~/ size.y);
    }
  }

  void selectedClicked(MouseEvent event) {
    selected = null;
  }

  @ViewChild('viewport')
  DivElement viewportDiv;

  Tile selected;

  void wheeled(WheelEvent event) {
    if (event.deltaY < 0) {
      if(sizeIndex < sizes.length - 1) sizeIndex++;
      else sizeIndex = sizes.length - 1;
    } else {
      if(sizeIndex > 0) sizeIndex--;
      else sizeIndex = 0;
    }
  }
}

const sizes = const <Point<int>>[
  Point<int>(64, 64),
  Point<int>(96, 96),
  Point<int>(128, 128),
];
