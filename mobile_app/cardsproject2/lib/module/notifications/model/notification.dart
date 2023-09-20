class Notification {
  int? id;
  String? title;
  String? description;
  String? image;
  bool? isRead;
  String? createdAt;

  Notification({
    this.id,
    this.title,
    this.description,
    this.image,
    this.isRead,
    this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      isRead: json['is_read'] == "1",
      createdAt: json['created_at'],
    );
  }
}
