import 'package:angular/angular.dart';
import 'package:data/city_tiles/building.dart';

@Component(
  selector: 'building-list-item',
  styleUrls: ['component.css'],
  templateUrl: 'component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
  ],
)
class BuildingListItemComponent {
  @Input()
  BuildingStats item;
}
