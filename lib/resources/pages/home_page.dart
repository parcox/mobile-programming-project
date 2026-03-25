import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/controllers/home_controller.dart';
import '../../app/models/destination.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_page.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ('/home', (_) => HomePage());

  const HomePage({super.key}) : super(child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  // These lists will hold destination data from the controller
  List<Destination> _featured = [];
  List<Destination> _allDestinations = [];

  // Currently selected category filter
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Beach', 'Mountain', 'City', 'Diving', 'Adventure'];

  @override
  get init => () async {
    // Load data from the controller
    _featured = controller.getOnlyFeatured();
    _allDestinations = controller.getFeaturedDestinations();
  };

  // ─── TODO A1 ──────────────────────────────────────────────────────────────
  // Implement _filterByCategory(String category)
  // When called:
  //   1. Update _selectedCategory to the given category
  //   2. If category == 'All', set _allDestinations to all destinations
  //   3. Otherwise, use controller.getByCategory(category)
  //   4. Call setState() to rebuild the UI
  // ─────────────────────────────────────────────────────────────────────────
  void _filterByCategory(String category) {
    // TODO A1: your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    _buildGreetingSection(),
                    const SizedBox(height: 24),
                    _buildSearchBar(),
                    const SizedBox(height: 28),
                    _buildSectionTitle('✈️ Featured Destinations'),
                    const SizedBox(height: 16),
                    _buildFeaturedList(),
                    const SizedBox(height: 28),
                    _buildSectionTitle('🗺️ Explore All'),
                    const SizedBox(height: 12),
                    _buildCategoryFilter(),
                    const SizedBox(height: 16),
                    _buildDestinationList(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── TODO A2 ──────────────────────────────────────────────────────────────
  // Build the SliverAppBar with:
  //   - expandedHeight: 220
  //   - pinned: true
  //   - A FlexibleSpaceBar with:
  //       title: Text 'Hello Travel 🌍' in white, fontSize 18
  //       background: a Stack with:
  //         (a) CachedNetworkImage (or Image.network) filling the space
  //             URL: 'https://images.unsplash.com/photo-1488085061387-422e29b40080?w=1200'
  //             BoxFit.cover
  //         (b) A dark gradient overlay (Colors.black opacity 0.3 to transparent)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildSliverAppBar() {
    // TODO A2: your code here
    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

  // ─── TODO A3 ──────────────────────────────────────────────────────────────
  // Build the greeting section with:
  //   - A Text: 'Good Morning! 👋' (or time-based greeting)
  //     Style: fontSize 14, color grey[600]
  //   - Below it, a RichText with:
  //       'Discover '  (fontSize 26, bold, black)
  //       'Your Next\nAdventure'  (fontSize 26, bold, deepPurple)
  // Hint: use RichText with TextSpan children
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildGreetingSection() {
    // TODO A3: your code here
    return const SizedBox.shrink();
  }

  // Search bar — complete, no TODO
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search destinations...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  // Section title helper — complete, no TODO
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  // ─── TODO A4 ──────────────────────────────────────────────────────────────
  // Build the horizontal featured destinations list:
  //   - Use SizedBox height 260
  //   - Inside: ListView.builder (scrollDirection: Axis.horizontal)
  //   - itemCount: _featured.length
  //   - Each item: DestinationCard(destination, onTap, isHorizontal: true)
  //   - onTap should call: routeTo(DestinationDetailPage.path, data: destination)
  // If _featured is empty, show a centered Text: 'No featured destinations'
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildFeaturedList() {
    // TODO A4: your code here
    return const SizedBox(height: 260, child: Center(child: Text('TODO A4')));
  }

  // ─── TODO A5 ──────────────────────────────────────────────────────────────
  // Build the horizontal category filter chips:
  //   - Use SizedBox height 40
  //   - Inside: ListView.builder (scrollDirection: Axis.horizontal)
  //   - itemCount: _categories.length
  //   - Each item: a GestureDetector wrapping a Container (chip-style)
  //     - If _categories[i] == _selectedCategory:
  //         background: deepPurple, text: white
  //     - Else:
  //         background: white, text: grey[700], border: grey[300]
  //     - Padding: horizontal 16, vertical 8
  //     - BorderRadius: 20
  //     - onTap: call _filterByCategory(_categories[i])
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildCategoryFilter() {
    // TODO A5: your code here
    return const SizedBox(height: 40, child: Center(child: Text('TODO A5')));
  }

  // ─── TODO A6 ──────────────────────────────────────────────────────────────
  // Build the vertical list of all destinations:
  //   - Use ListView.builder with shrinkWrap: true
  //     and physics: NeverScrollableScrollPhysics()
  //   - itemCount: _allDestinations.length
  //   - Each item: DestinationCard(destination, onTap, isHorizontal: false)
  //   - onTap: routeTo(DestinationDetailPage.path, data: destination)
  // If _allDestinations is empty, show centered Text: 'No destinations found'
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildDestinationList() {
    // TODO A6: your code here
    return const Center(child: Text('TODO A6'));
  }
}
