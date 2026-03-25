import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/models/destination.dart';

class DestinationDetailPage extends NyStatefulWidget {
  static RouteView path = ('/destination-detail', (_) => DestinationDetailPage());

  const DestinationDetailPage({super.key}) : super(child: _DestinationDetailPageState());
}

class _DestinationDetailPageState extends NyState<DestinationDetailPage> {
  Destination? _destination;

  @override
  get init => () async {
    // Receive the Destination object passed via routeTo()
    _destination = widget.data();
  };

  @override
  Widget build(BuildContext context) {
    if (_destination == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final dest = _destination!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ─── TODO C1 ────────────────────────────────────────────────────
          // Build a SliverAppBar with:
          //   - expandedHeight: 300
          //   - pinned: true
          //   - A back button (leading: BackButton in white)
          //   - FlexibleSpaceBar with:
          //       title: Text(dest.name) in white, fontSize 20
          //       background: CachedNetworkImage of dest.imageUrl, BoxFit.cover
          //         with a dark gradient overlay at the bottom
          // ────────────────────────────────────────────────────────────────
          // TODO C1: Replace this placeholder
          const SliverToBoxAdapter(child: SizedBox(height: 300, child: Placeholder())),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── TODO C2 ──────────────────────────────────────────
                  // Row with:
                  //   Left: Column with dest.name (bold, 24) and
                  //         Row(icon + dest.country) in grey
                  //   Right (Spacer then): Column with
                  //         RatingBarIndicator (rating: dest.rating, size 18)
                  //         Text('${dest.rating}/5.0', fontSize 12, grey)
                  // ─────────────────────────────────────────────────────
                  // TODO C2: your code here
                  const SizedBox(height: 20),

                  // Category badge (complete)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      dest.category,
                      style: const TextStyle(color: Colors.deepPurple, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ─── TODO C3 ──────────────────────────────────────────
                  // Section title 'About' (bold, 18)
                  // Below it: Text(dest.description)
                  //   Style: fontSize 15, height 1.6, color grey[700]
                  // ─────────────────────────────────────────────────────
                  // TODO C3: your code here
                  const SizedBox(height: 28),

                  // ─── TODO C4 ──────────────────────────────────────────
                  // An ElevatedButton.icon with:
                  //   icon: Icons.bookmark_add_outlined
                  //   label: 'Save to Wishlist'
                  //   onPressed: show a SnackBar:
                  //     '${dest.name} added to your wishlist!'
                  //   Style: full width (minimumSize: Size(double.infinity, 52))
                  //   backgroundColor: Colors.deepPurple
                  // ─────────────────────────────────────────────────────
                  // TODO C4: your code here
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
