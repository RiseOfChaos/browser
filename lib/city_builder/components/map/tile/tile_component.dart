import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

class Building {
  BuildingStats info;

  int level;

  Building({this.info, this.level});
}

@Component(
  selector: 'building-view',
  styleUrls: ['tile_component.css'],
  templateUrl: 'tile_component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
  ],
)
class BuildingComponent {
  @Input()
  Building building;

  void placeClicked(e) {}
}
