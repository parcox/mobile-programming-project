/// Destination model representing a travel location.
/// This is a plain Dart class (PODO — Plain Old Dart Object).
class Destination {
  final String id;
  final String name;
  final String country;
  final String imageUrl;
  final String description;
  final double rating;
  final String category; // e.g. 'Beach', 'Mountain', 'City'
  final bool isFeatured;

  const Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.description,
    required this.rating,
    this.category = 'General',
    this.isFeatured = false,
  });

  /// Factory constructor — creates a Destination from a Map (e.g., JSON)
  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      id: map['id'] as String,
      name: map['name'] as String,
      country: map['country'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      rating: (map['rating'] as num).toDouble(),
      category: map['category'] as String? ?? 'General',
      isFeatured: map['isFeatured'] as bool? ?? false,
    );
  }

  /// Converts this object back to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'imageUrl': imageUrl,
      'description': description,
      'rating': rating,
      'category': category,
      'isFeatured': isFeatured,
    };
  }

  @override
  String toString() => 'Destination($name, $country, rating: $rating)';
}
