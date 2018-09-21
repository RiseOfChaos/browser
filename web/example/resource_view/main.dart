import 'package:angular/angular.dart';
import 'package:browser/city_builder/components/resource_view/resource_view_component.dart';
import 'main.template.dart' as ng;

import 'package:data/resource/resource.dart';

@Component(
  selector: 'my-app',
  // styleUrls: ['app_component.css'],
  directives: [ResourceViewComponent],
  template: """
<resource-view [max]='max' [rate]='rate' [amount]='amount' [info]='info'></resource-view>
  """
)
class AppComponent {
  int max = 1500;

  int rate = 100;

  int amount = 500;

  final ResourceInfo info = uranium;
}

void main() {
  runApp(ng.AppComponentNgFactory);
}
