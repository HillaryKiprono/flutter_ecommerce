class Category {
  final String electronics;
  final String jewelry;
  final String mensClothing;
  final String womensClothing;

  Category({
    required this.electronics,
    required this.jewelry,
    required this.mensClothing,
    required this.womensClothing,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      electronics: json['electronics'] ?? '',
      jewelry: json['jewelery'] ?? '',
      mensClothing: json['men\'s clothing'] ?? '',
      womensClothing: json['women\'s clothing'] ?? '',
    );
  }
}
