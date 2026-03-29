import 'package:nylo_framework/nylo_framework.dart';

import '../models/destination.dart';
import '../networking/destination_api_service.dart';

class HomeController extends NyController {
  HomeController();

  // Data is sourced from DestinationApiService — not stored here.
  // This follows Nylo's separation of concerns:
  //   Controller = UI logic / state management
  //   ApiService = data layer
  final DestinationApiService _destinationService = DestinationApiService();

  List<Destination> getFeaturedDestinations() => _destinationService.fetchAll();

  List<Destination> getOnlyFeatured() => _destinationService.fetchFeatured();

  List<Destination> getByCategory(String category) =>
      _destinationService.fetchByCategory(category);
}
