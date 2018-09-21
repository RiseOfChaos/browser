import 'dart:html';

import 'package:angular/angular.dart';

import 'package:data/resource/resource.dart';

@Component(
  selector: 'resource-view',
  styleUrls: ['resource_view_component.css'],
  templateUrl: 'resource_view_component.html',
  directives: [
    NgFor,
    NgIf,
    NgClass,
  ],
)
class ResourceViewComponent {
  @Input()
  int max = 0;

  @Input()
  int rate = 0;

  @Input()
  int amount = 0;

  @Input()
  ResourceInfo info;

  int get progress {
    if (max is! int || amount is! int || max == 0) return 0;

    int ret = ((amount / max) * 100).toInt();

    if (ret > 100) return 100;
    return ret;
  }

  progressClick(MouseEvent event) {
    // TODO
  }
}
