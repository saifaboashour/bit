class Terms{
  final int? id;
  final String? name;
  final String? details;

  Terms({
    this.id,
    this.name,
    this.details,
  });

  factory Terms.fromJson(Map<String, dynamic> json) {
    return Terms(
      id: json['id'],
      name: json['name'],
      details: json['term'],
    );
  }
}