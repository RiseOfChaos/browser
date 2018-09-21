import 'package:angular/angular.dart';
import 'package:browser/city_builder/components/resources_view/resources_view_component.dart';
import 'main.template.dart' as ng;

import 'package:data/resource/resource.dart';

@Component(selector: 'my-app',
    // styleUrls: ['app_component.css'],
    directives: [ResourcesViewComponent], template: """
<resources-view [max]='max' [rate]='rate' [amount]='amount'></resources-view>
  """)
class AppComponent {
  Resources max = Resources(adamantium: 1500, magnetite: 1000, uranium: 2000);

  Resources rate = Resources(adamantium: 100, magnetite: 110, uranium: 80);

  Resources amount = Resources(adamantium: 1000, magnetite: 800, uranium: 500);
}

void main() {
  runApp(ng.AppComponentNgFactory);
}
