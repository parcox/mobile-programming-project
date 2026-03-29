import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/models/destination.dart';

class DestinationDetailPage extends NyStatefulWidget {
  static RouteView path = (
    '/destination-detail',
    (_) => DestinationDetailPage(),
  );

  DestinationDetailPage({super.key})
    : super(child: () => _DestinationDetailPageState());
}

class _DestinationDetailPageState extends NyPage<DestinationDetailPage> {
  Destination? _destination;

  @override
  get init => () async {
    // Receive the Destination object passed via routeTo()
    _destination = widget.data();
  };

  @override
  Widget build(BuildContext context) {
    if (_destination == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final dest = _destination!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: const BackButton(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                dest.name,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: dest.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[300]),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dest.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                dest.country,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBarIndicator(
                            rating: dest.rating,
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 18,
                          ),
                          Text(
                            '${dest.rating}/5.0',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Category badge (complete)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      dest.category,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TODO C1: Show the 'About' section title and description
                  // 1. const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  // 2. const SizedBox(height: 8)
                  // 3. Text(dest.description, style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.6))
                  const SizedBox(height: 28),

                  // TODO C2: Add a full-width 'Save to Wishlist' button
                  // ElevatedButton.icon(
                  //   icon: const Icon(Icons.bookmark_add_outlined),
                  //   label: const Text('Save to Wishlist'),
                  //   style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 52), backgroundColor: Colors.deepPurple),
                  //   onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text('${dest.name} added to your wishlist!'))))
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
