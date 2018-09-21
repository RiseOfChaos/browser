import 'package:angular/angular.dart';
import 'package:browser/city_builder/map/city_map/city_map_component.dart';

import 'package:data/city_tiles/building.dart';

@Component(
    selector: 'my-app',
    // styleUrls: ['app_component.css'],
    directives: [CityMapComponent],
    template: """
<city-map></city-map>
  """
)
class AppComponent {
}
