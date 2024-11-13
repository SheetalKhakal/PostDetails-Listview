class Posts {
  List<Post> posts;
  int total;
  int skip;
  int limit;

  Posts({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  Posts copyWith({
    List<Post>? posts,
    int? total,
    int? skip,
    int? limit,
  }) =>
      Posts(
        posts: posts ?? this.posts,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Post {
  int id;
  String title;
  String body;
  List<String> tags;
  Reactions reactions;
  int views;
  int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    required this.userId,
  });

  Post copyWith({
    int? id,
    String? title,
    String? body,
    List<String>? tags,
    Reactions? reactions,
    int? views,
    int? userId,
  }) =>
      Post(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        tags: tags ?? this.tags,
        reactions: reactions ?? this.reactions,
        views: views ?? this.views,
        userId: userId ?? this.userId,
      );

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        reactions: Reactions.fromJson(json["reactions"]),
        views: json["views"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reactions": reactions.toJson(),
        "views": views,
        "userId": userId,
      };
}

class Reactions {
  int likes;
  int dislikes;

  Reactions({
    required this.likes,
    required this.dislikes,
  });

  Reactions copyWith({
    int? likes,
    int? dislikes,
  }) =>
      Reactions(
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
      );

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        likes: json["likes"],
        dislikes: json["dislikes"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "dislikes": dislikes,
      };
}
