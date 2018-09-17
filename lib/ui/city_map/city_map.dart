import 'dart:math';
import 'package:nuts/nuts.dart';

import '../../models/city/city.dart';

import 'empty_tile_roulette.dart';

class ResourceTileView implements Component {
  CityResourceTile tile;

  int tileWidth;

  int tileHeight;

  String get key => tile.pos.toString();

  ResourceTileView(this.tile, this.tileWidth, this.tileHeight);

  final onSelect = Emitter<CityResourceTile>();

  View get view {
    return Absolute(
        child: TextField(text: tile.toString()),
        classes: [
          'city-tile',
          'city-tile-res',
          'city-tile-at-' + tile.pos.toString()
        ],
        left: FixedDistance(tileWidth * tile.xpos),
        top: FixedDistance(tileHeight * tile.ypos),
        width: FixedDistance(tileWidth),
        height: FixedDistance(tileHeight))
      ..onClick.pipeSame(onSelect, value: tile);
  }
}

class BuildingTileView implements Component {
  CityBuildingTile tile;

  int tileWidth;

  int tileHeight;

  String get key => tile.pos.toString();

  BuildingTileView(this.tile, this.tileWidth, this.tileHeight);

  View get view {
    return Absolute(
        classes: [
          'city-tile',
          'city-tile-building',
          'city-tile-at-' + tile.pos.toString()
        ],
        left: tileWidth * tile.xpos,
        top: tileHeight * tile.ypos,
        width: tileWidth,
        height: tileHeight);
  }
}

class CityMapViewSettings {
  int tileWidth;

  int tileHeight;

  int x;

  int y;

  CityMapViewSettings(
      {this.tileWidth: 128, this.tileHeight: 80, this.x: 0, this.y: 0});

  int get wholeWidth => tileWidth * (ICity.numCols + 14);

  int get wholeHeight => tileHeight * (ICity.numRows + 14);

  /// Map width
  int get innerWidth => tileWidth * ICity.numCols;

  /// map height
  int get innerHeight => tileHeight * ICity.numRows;
}

class CityMapView implements Component {
  City city;

  final CityMapViewSettings viewSettings;

  final String key = 'map';

  CityMapView(this.city, this.viewSettings);

  View get view {
    return Relative(
      classes: ['map-viewport'],
      // TODO tabIndex
      child: Absolute(
        classes: ['map-whole'],
        left: FixedDistance(viewSettings.x),
        top: FixedDistance(viewSettings.y),
        width: FixedDistance(viewSettings.wholeWidth),
        height: FixedDistance(viewSettings.wholeHeight),
        backgroundImage: 'url(/static/images/city/land/0.png)',
        children: [
          Absolute(
            key: 'map-inner',
            classes: ['map-inner'],
            left: FixedDistance(viewSettings.tileWidth * 7),
            top: FixedDistance(viewSettings.tileHeight * 7),
            width: FixedDistance(viewSettings.innerWidth),
            height: FixedDistance(viewSettings.innerHeight),
            children: RxChildList<CityTile>(city.tiles, (tile) {
              if (tile is CityResourceTile) {
                return ResourceTileView(
                    tile, viewSettings.tileWidth, viewSettings.tileHeight)
                  ..onSelect.on(() {
                    if (selected.value != tile) selected.value = tile;
                  });
              } else if (tile is CityBuildingTile) {
                return BuildingTileView(
                    tile, viewSettings.tileWidth, viewSettings.tileHeight);
              }
              return Absolute(classes: ['hidden']);
            }),
            onClick: (ClickEvent event) {
              if (!event.firedOnMe) {
                return;
              }
              int col = event.offset.x ~/ viewSettings.tileWidth;
              int row = event.offset.y ~/ viewSettings.tileHeight;

              selected.value = CityEmptyTile()..setData(city, col, row);
            },
          ) /* map-inner */,
          VariableView.rx(selected, (p) {
            if (p is CityEmptyTile) return EmptyTileRoulette(viewSettings, p);
            if (p is CityBuildingTile) return BuildingRoulette(viewSettings, p);
            if (p is CityResourceTile) return ResourceRoulette(viewSettings, p);
            return Box();
          }),
        ],
      ) /* map-land */,
    ) /* map-viewport */;
  }

  final selected = RxValue<CityTile>();
}
