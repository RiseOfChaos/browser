import 'package:angular/angular.dart';
import 'package:browser/city_builder/components/map/city_map_component.dart';

import 'package:data/city_tiles/building.dart';

import 'package:browser/city_builder/models/city.dart';

@Component(
    selector: 'my-app',
    // styleUrls: ['app_component.css'],
    directives: [CityMapComponent],
    template: """
<city-map [city]='city'></city-map>
  """,
  styles: ["""
:host {
  width: 100%;
  height: 100%;
  display: block;
}
  """],
)
class AppComponent {
  City city = City();
}
