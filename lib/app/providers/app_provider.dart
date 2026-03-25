import 'package:nylo_framework/nylo_framework.dart';

import '../../routes/router.dart';
import '../themes/light_theme.dart';

class AppProvider implements NyProvider {
  @override
  boot(Nylo nylo) async {
    await nylo.addRouter(appRouter());

    nylo.addTheme(
      id: 'default_theme',
      theme: lightTheme(),
      darkTheme: lightTheme(),
    );

    return nylo;
  }
}
