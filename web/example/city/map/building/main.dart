import 'package:angular/angular.dart';
import 'package:browser/city_builder/components/map/tile/tile_component.dart';
import 'main.template.dart' as ng;

import 'package:data/city_tiles/building.dart';

@Component(
  selector: 'my-app',
  // styleUrls: ['app_component.css'],
  directives: [BuildingComponent],
  template: """
<building-view [block]='building'></building-view>
  """
)
class AppComponent {
  Building building = Building(info: barrack, level: 1);
}

void main() {
  runApp(ng.AppComponentNgFactory);
}
