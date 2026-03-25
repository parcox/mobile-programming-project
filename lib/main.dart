import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'app/providers/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await bootApplication(AppProvider());
  runApp(AppBoot(nylo: nylo));
}
