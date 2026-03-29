import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/controllers/home_controller.dart';
import '../../app/models/destination.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_page.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  static RouteView path = ('/home', (_) => HomePage());

  HomePage({super.key}) : super(child: () => _HomePageState());
}

class _HomePageState extends NyPage<HomePage> {
  // These lists will hold destination data from the controller
  List<Destination> _featured = [];
  List<Destination> _allDestinations = [];

  // Currently selected category filter
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Beach',
    'Mountain',
    'City',
    'Diving',
    'Adventure',
  ];

  @override
  get init => () async {
    // Load data from the controller
    _featured = widget.controller.getOnlyFeatured();
    _allDestinations = widget.controller.getFeaturedDestinations();
  };

  // ─── TODO A1 ──────────────────────────────────────────────────────────────
  // Complete this function so tapping a category chip filters the list.
  // Hint:
  //   setState(() {
  //     _selectedCategory = category;
  //     _allDestinations = category == 'All'
  //         ? widget.controller.getFeaturedDestinations()
  //         : widget.controller.getByCategory(category);
  //   });
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

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Hello Travel 🌍',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1488085061387-422e29b40080?w=1200',
              fit: BoxFit.cover,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning! 👋',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Discover ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text: 'Your Next\nAdventure',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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

  Widget _buildFeaturedList() {
    if (_featured.isEmpty) {
      return const SizedBox(
        height: 260,
        child: Center(child: Text('No featured destinations')),
      );
    }
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _featured.length,
        itemBuilder: (context, index) {
          final destination = _featured[index];
          return DestinationCard(
            destination: destination,
            isHorizontal: true,
            onTap: () => routeTo(DestinationDetailPage.path, data: destination),
          );
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () => _filterByCategory(category),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepPurple : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDestinationList() {
    if (_allDestinations.isEmpty) {
      return const Center(child: Text('No destinations found'));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _allDestinations.length,
      itemBuilder: (context, index) {
        final destination = _allDestinations[index];
        return DestinationCard(
          destination: destination,
          isHorizontal: false,
          onTap: () => routeTo(DestinationDetailPage.path, data: destination),
        );
      },
    );
  }
}
