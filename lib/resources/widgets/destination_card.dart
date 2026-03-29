import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app/models/destination.dart';

/// A card widget displaying a single travel destination.
/// Used in the horizontal featured list and the vertical full list.
class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;
  final bool isHorizontal; // true = compact card, false = full-width card

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? _buildHorizontalCard() : _buildVerticalCard();
  }

  /// Compact card for horizontal scroll (featured section)
  Widget _buildHorizontalCard() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image
              SizedBox(
                height: 240,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: destination.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[300]),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),

              // Gradient overlay so text is readable over the image
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),

              // Text overlay at the bottom
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO B1: Show destination.name as white bold Text
                    // Text(destination.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis)
                    const SizedBox(height: 4),

                    // TODO B2: Show a Row with location icon and country name
                    // Row(children: [Icon(Icons.location_on, size: 12, color: Colors.white70), SizedBox(width: 4), Text(destination.country, style: const TextStyle(color: Colors.white70, fontSize: 12))])
                    const SizedBox(height: 6),

                    // Rating bar (complete — no TODO)
                    RatingBarIndicator(
                      rating: destination.rating,
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 14,
                    ),
                  ],
                ),
              ),

              // Featured badge
              if (destination.isFeatured)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Full-width card for vertical scroll (all destinations section)
  Widget _buildVerticalCard() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Thumbnail image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: destination.imageUrl,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(width: 110, height: 110, color: Colors.grey[300]),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.broken_image),
              ),
            ),

            // Text info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO B3: Show destination.name as bold Text
                    // Text(destination.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    const SizedBox(height: 4),

                    // TODO B4: Show a Row with location icon and country
                    // Row(children: [Icon(Icons.location_on, size: 14, color: Colors.deepPurple), SizedBox(width: 4), Text(destination.country, style: TextStyle(fontSize: 13, color: Colors.grey[600]))])
                    const SizedBox(height: 6),

                    // TODO B5: Show a Row with star icon and rating
                    // Row(children: [Icon(Icons.star, size: 14, color: Colors.amber), SizedBox(width: 4), Text('${destination.rating}', style: const TextStyle(fontSize: 13))])
                    const SizedBox(height: 6),

                    // Category chip (complete — no TODO)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        destination.category,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Arrow icon
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
