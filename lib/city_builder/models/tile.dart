import 'package:data/data.dart';

import 'city.dart';

abstract class CityTile {
  City city;

  int x;

  int y;

  int get pos => (y * ICity.numCols) + x;

  CityTile({this.city, this.x, this.y});
}

class CityResourceTile extends CityTile {
  CityResourceTileInfo info;

  CityResourceTile({City city, this.info, int x, int y})
      : super(city: city, x: x, y: y);

  void changeCity({City city, int x, int y, CityResourceTileInfo info}) {
    this.city = city;
    this.x = x;
    this.y = y;
    this.info = info;
  }

  String toString() => "CityRes(x: $x, y: $y, type: ${info.name})";
}

class CityBuildingTile extends CityTile {
  BuildingStats info;

  int level;

  CityBuildingTile({City city, this.info, int x, int y, this.level})
      : super(city: city, x: x, y: y);

  void changeCity({City city, int x, int y, BuildingStats info, int level}) {
    this.city = city;
    this.x = x;
    this.y = y;
    this.info = info;
    this.level = level;
  }

  String get imageUrl => info.info.imageUrl;

  String toString() => "CitySlot(x: $x, y: $y)";
}
