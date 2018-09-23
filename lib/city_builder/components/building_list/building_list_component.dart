import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

import 'item/component.dart';
import 'info/component.dart';

@Component(
  selector: 'building-list',
  styleUrls: ['building_list_component.css'],
  templateUrl: 'building_list_component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
    BuildingListItemComponent,
    BuildingItemInfoComponent,
  ],
)
class BuildingListComponent {
  final List<BuildingStats> resource = resourceBuildings;
  final List<BuildingStats> military = militaryBuildings;
  BuildingStats barrackBuilding = barrack;
  int selected = 0;

  BuildingStats showingFor;

  void showFor(BuildingStats item) {
    showingFor = item;
  }
}
