import 'package:nylo_framework/nylo_framework.dart';

import '../models/destination.dart';

class HomeController extends NyController {
  HomeController();

  /// Simulated data — in a real app this would come from an API.
  /// Returns a list of featured destinations.
  List<Destination> getFeaturedDestinations() {
    return [
      const Destination(
        id: '1',
        name: 'Bali',
        country: 'Indonesia',
        imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
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
        imageUrl: 'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800',
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
        imageUrl: 'https://images.unsplash.com/photo-1605462863863-10d9e47e15ee?w=800',
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
        imageUrl: 'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=800',
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
        imageUrl: 'https://images.unsplash.com/photo-1518002054494-3a6f94352e9d?w=800',
        description:
            'Lombok offers Mount Rinjani for trekkers, the Gili Islands for '
            'snorkelers, and quieter, more pristine beaches than its neighbour Bali.',
        rating: 4.5,
        category: 'Beach',
        isFeatured: false,
      ),
    ];
  }

  /// Returns only the destinations marked as featured
  List<Destination> getOnlyFeatured() {
    return getFeaturedDestinations()
        .where((d) => d.isFeatured)
        .toList();
  }

  /// Returns destinations filtered by category
  List<Destination> getByCategory(String category) {
    return getFeaturedDestinations()
        .where((d) => d.category == category)
        .toList();
  }
}
