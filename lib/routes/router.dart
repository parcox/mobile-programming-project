import 'package:nylo_framework/nylo_framework.dart';

import '../resources/pages/home_page.dart';
import '../resources/pages/destination_detail_page.dart';

/* App Router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
  router.add(HomePage.path).initialRoute();
  router.add(DestinationDetailPage.path);
});
