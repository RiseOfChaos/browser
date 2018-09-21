import 'package:angular/angular.dart';

import 'package:data/resource/resource.dart';

import '../resource_view/resource_view_component.dart';

@Component(
  selector: 'resources-view',
  styleUrls: ['resources_view_component.css'],
  templateUrl: 'resources_view_component.html',
  directives: [ResourceViewComponent]
)
class ResourcesViewComponent {
  @Input()
  Resources max = Resources();

  @Input()
  Resources rate = Resources();

  @Input()
  Resources amount = Resources();

  List<ResourceInfo> get infos => resourceInfos;
}
