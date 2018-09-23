import 'package:angular/angular.dart';
import 'package:browser/city_builder/components/building_list/building_list_component.dart';
import 'package:browser/city_builder/components/building_list/item/component.dart';

import 'package:data/city_tiles/building.dart';

@Component(
    selector: 'my-app',
    // styleUrls: ['app_component.css'],
    directives: [BuildingListComponent],
    template: """
<building-list></building-list>
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
  BuildingStats item = barrack;
}
