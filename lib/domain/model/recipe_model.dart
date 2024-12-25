class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final int likes;
  final int commentsCount;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.likes,
    required this.commentsCount,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      category: map['category'],
      likes: map['likes'],
      commentsCount: map['commentsCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'likes': likes,
      'commentsCount': commentsCount,
    };
  }
}
