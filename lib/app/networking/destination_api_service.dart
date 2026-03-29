import 'package:nylo_framework/nylo_framework.dart';

import '../models/destination.dart';

/* DestinationApiService
| -------------------------------------------------------------------------
| Responsible for supplying destination data to the app.
|
| In a real app, each method below would make an HTTP call using network():
|   return await network<List<Destination>>(
|     request: (request) => request.get('/destinations'),
|   );
|
| For now, the methods return simulated (local) data so the app works
| without a backend. When you connect a real API, only this file needs to
| change — the controller and pages stay the same.
|
| Learn more: https://nylo.dev/en/docs/7.x/networking
|-------------------------------------------------------------------------- */

class DestinationApiService extends NyApiService {
  DestinationApiService() : super(decoders: {});

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  // ─── Simulated data ───────────────────────────────────────────────────────
  // In a real project this list would come from getEnv('API_BASE_URL').
  // Replace the imageUrl values with your own Unsplash photos (TODO D1).

  static final List<Destination> _destinations = [
    const Destination(
      id: '1',
      name: 'Bali',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800', // TODO D1: change this URL
      description:
          'Known as the Island of the Gods, Bali offers stunning rice terraces, '
          'ancient temples, vibrant nightlife, and world-class surf beaches.',
      rating: 4.8,
      category: 'Beach',
      isFeatured: true,
    ),
    const Destination(
      id: '2',
      name: 'Raja Ampat',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800', // TODO D1: change this URL
      description:
          'A remote archipelago in West Papua, Raja Ampat has some of the '
          'richest marine biodiversity on the planet, with pristine coral reefs.',
      rating: 4.9,
      category: 'Diving',
      isFeatured: true,
    ),
    const Destination(
      id: '3',
      name: 'Komodo Island',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1605462863863-10d9e47e15ee?w=800', // TODO D1: change this URL
      description:
          'Home of the Komodo dragon, the world\'s largest lizard. The island '
          'also features pink sand beaches and spectacular diving spots.',
      rating: 4.7,
      category: 'Adventure',
      isFeatured: false,
    ),
    const Destination(
      id: '4',
      name: 'Labuan Bajo',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=800', // TODO D1: change this URL
      description:
          'The gateway to Komodo National Park, Labuan Bajo is a fishing '
          'town that has transformed into a premium tourist destination.',
      rating: 4.6,
      category: 'Adventure',
      isFeatured: false,
    ),
    const Destination(
      id: '5',
      name: 'Lombok',
      country: 'Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1518002054494-3a6f94352e9d?w=800', // TODO D1: change this URL
      description:
          'Lombok offers Mount Rinjani for trekkers, the Gili Islands for '
          'snorkelers, and quieter, more pristine beaches than its neighbour Bali.',
      rating: 4.5,
      category: 'Beach',
      isFeatured: false,
    ),
  ];

  /// Returns all destinations.
  /// In a real app: network<List<Destination>>(request: (r) => r.get('/destinations'))
  List<Destination> fetchAll() => _destinations;

  /// Returns only destinations marked as featured.
  List<Destination> fetchFeatured() =>
      _destinations.where((d) => d.isFeatured).toList();

  /// Returns destinations that match the given [category].
  List<Destination> fetchByCategory(String category) =>
      _destinations.where((d) => d.category == category).toList();
}
