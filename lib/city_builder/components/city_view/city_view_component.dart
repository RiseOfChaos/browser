import 'package:angular/angular.dart';

import 'package:browser/city_builder/models/city.dart';

import 'package:browser/city_builder/components/map/city_map_component.dart';
import 'package:browser/city_builder/components/building_list/building_list_component.dart';

@Component(
  selector: 'city-view',
  styleUrls: ['city_view_component.css'],
  templateUrl: 'city_view_component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
    CityMapComponent,
    BuildingListComponent,
  ],
)
class CityViewComponent {
  @Input()
  City city;

  bool showingBuildingList = false;

  void handleSelectionChange(CityTile tile) {
    showingBuildingList = tile is EmptyCityTile;
  }
}
