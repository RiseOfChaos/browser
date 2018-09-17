import 'dart:math';
import 'package:nuts/nuts.dart';

import '../../models/city/city.dart';
import 'city_map.dart';

abstract class CityRoulette {
  CityMapViewSettings get viewSettings;

  CityTile get tile;
}

class EmptyTileRoulette implements Component, CityRoulette {
  final CityMapViewSettings viewSettings;

  final CityEmptyTile tile;

  @override
  String get key => 'city-roulette-empty';

  EmptyTileRoulette(this.viewSettings, this.tile);

  @override
  View get view {
    return Absolute(
        classes: ['city-roulette', 'city-roulette-empty'],
        width: viewSettings.tileWidth,
        height: viewSettings.tileHeight,
        left: (tile.xpos + 7) * viewSettings.tileWidth,
        top: (tile.ypos + 7) * viewSettings.tileHeight);
  }
}

class BuildingRoulette implements Component, CityRoulette {
  final CityMapViewSettings viewSettings;

  final CityBuildingTile tile;

  @override
  String get key => 'city-roulette-building';

  BuildingRoulette(this.viewSettings, this.tile);

  @override
  View get view {
    return Absolute(
        classes: ['city-roulette', 'city-roulette-building'],
        width: viewSettings.tileWidth,
        height: viewSettings.tileHeight,
        left: (tile.xpos + 7) * viewSettings.tileWidth,
        top: (tile.ypos + 7) * viewSettings.tileHeight);
  }
}

class ResourceRoulette implements Component, CityRoulette {
  final CityMapViewSettings viewSettings;

  final CityResourceTile tile;

  @override
  String get key => 'city-roulette-resource';

  ResourceRoulette(this.viewSettings, this.tile);

  @override
  View get view {
    return Absolute(
        classes: ['city-roulette', 'city-roulette-resource'],
        width: viewSettings.tileWidth,
        height: viewSettings.tileHeight,
        left: (tile.xpos + 7) * viewSettings.tileWidth,
        top: (tile.ypos + 7) * viewSettings.tileHeight);
  }
}
