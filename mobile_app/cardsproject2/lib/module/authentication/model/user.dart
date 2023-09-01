class User {
  final int? id;

  User({
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
    );
  }
}
