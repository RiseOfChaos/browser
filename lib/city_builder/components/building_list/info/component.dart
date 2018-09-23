import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

@Component(
  selector: 'building-item-info',
  styleUrls: ['component.css'],
  templateUrl: 'component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
  ],
)
class BuildingItemInfoComponent {
  @Input()
  BuildingStats item;
}
