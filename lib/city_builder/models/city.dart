import 'package:data/data.dart';
import 'tile.dart';

class ResourceCounter {
  Resources _lastValue;

  DateTime _lastTime;

  ResourceCounter({Resources lastValue, DateTime lastTime})
      : _lastValue = lastValue ?? Resources(),
        _lastTime = lastTime ?? DateTime.now();

  Resources get resources {
    // TODO compute
  }
}

class City {
  /// Id of the city.
  String id;

  /// Name of the city.
  String name;

  /// Version of the city. Used to keep track of changes to the city.
  // TODO DateTime version;

  /// Map of position to city tile.
  Map<String, CityTile> tilesMap;

  final _resourceCounter = ResourceCounter();

  /// Current amount of resources in the city
  Resources get resources => _resourceCounter.resources;

// TODO Units

// TODO carts

// TODO Building queue

// TODO Recruitment queue

// TODO Trade list

  City();
}
