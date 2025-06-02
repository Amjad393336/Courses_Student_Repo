// lib/models/category_model.dart

class Category {
  final String name;
  final String assetPath;
  final int rating;

  Category({
    required this.name,
    required this.assetPath,
    required this.rating,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    final name = (json['name'] as String).trim();
    String asset;
    int rating;

    switch (name) {
      case 'طبي':
        asset = 'images/medical_course.jpg';
        rating = 4;
        break;
      case 'رياضيات':
        asset = 'images/math1_edit.jpg';
        rating = 3;
        break;
      case 'كيمياء':
        asset = 'images/chem1.jpg';
        rating = 5;
        break;
      default:
        asset = 'images/chem.jpg';
        rating = 0;
    }

    return Category(name: name, assetPath: asset, rating: rating);
  }
}
