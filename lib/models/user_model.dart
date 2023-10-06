
class User {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;

  User({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      albumId: json['albumId'],
      userId: json['userId'],
      name: json['name'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
