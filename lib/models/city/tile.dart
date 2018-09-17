import 'package:data/data.dart';

import 'city.dart';

abstract class CityTile {
  City city;

  int xpos;

  int ypos;

  int pos;
}

class CityEmptyTile extends CityTile {
  void setData(City city, int xpos, int ypos) {
    this.city = city;
    this.xpos = xpos;
    this.ypos = ypos;
    this.pos = (ypos * ICity.numCols) + xpos;
  }
}

class CityResourceTile extends CityTile {
  CityResourceTileInfo info;

  void setData(City city, int xpos, int ypos, int resType) {
    this.city = city;
    this.xpos = xpos;
    this.ypos = ypos;
    this.pos = (ypos * ICity.numCols) + xpos;
    info = cityResources[resType];
  }

  String get imageUrl => info.imageUrl;

  String toString() => "CityRes(x: $xpos, y: $ypos, type: ${info.name})";
}

class CityBuildingTile extends CityTile {
  BuildingStats info;

  int level;

  void changeCity(City city, int xpos, int ypos, int building, int level) {
    this.city = city;
    this.xpos = xpos;
    this.ypos = ypos;
    this.pos = (ypos * ICity.totalSlots) + xpos;
    this.info = buildings[building];
    this.level = level;
  }

  String get imageUrl => info.info.imageUrl;

  String toString() => "CitySlot(x: $xpos, y: $ypos)";
}

/* TODO
  @override
  void updateInfo() {
    BuildingInfo lNew = kBuildInfoNone;
    if (effType >= 0 && effType < BUILDINGINFOS.length) {
      lNew = BUILDINGINFOS[effType];
    } else if (effType >= 101 && effType < 101 + BUILDINGINFOS_NODES.length) {
      lNew = BUILDINGINFOS_NODES[effType - 101];
    } else if (effType == kEnhancerIdxPaddyField) {
      lNew = kEnhancerInfoPaddy;
    }

    if (info != lNew) {
      info = notifyPropertyChange(#info, info, lNew);
      notifyPropertyChange(#imageUrl, "", imageUrl);
      super.updateInfo();
    }
  }
 */

/*
  bool get isMovable =>
      effType < kBuildIdxNone && effType != kBuildIdxCityCenter;

  bool get isEmpty => effType == kBuildIdxNone;

  bool get isUnbuildable =>
      LAYOUTS[city.water][pos.toString()] == LAYOUT_ITEM_UNBUILDABLE;
 */

/*
  void addConstruction(Construction a_con) {
    constructions.add(a_con);
    a_con.place = this;
    if (a_con.action == CONSTRUCTIONACTION_UPGRADE) {
      if (effLevel < 10) {
        effLevel++;

        if (type == kBuildIdxNone) {
          effType = a_con.totype;
        }

        a_con.effLevel = effLevel;
      } else {
        a_con.effLevel = 10;
      }
    } else if (a_con.action == CONSTRUCTIONACTION_DOWNGRADE) {
      if (effLevel > 0) {
        effLevel--;

        a_con.effLevel = effLevel;
      } else {
        a_con.effLevel = 0;
      }
    } else if (a_con.action == CONSTRUCTIONACTION_DEMOLISH) {
      effLevel = 0;
      a_con.effLevel = effLevel;
    }

    action = a_con.action;
  }

  @override
  Map getConstructionMap() {
    return {"P": pos, "T": this._effType};
  }
  */

/* TODO
  bool get isCoast => LAYOUTS[city.water][pos.toString()] == LAYOUT_ITEM_COAST;

  bool get isLand => LAYOUTS[city.water][pos.toString()] == LAYOUT_ITEM_LAND;

  int get terrain => LAYOUTS[city.water][pos.toString()];
  */
