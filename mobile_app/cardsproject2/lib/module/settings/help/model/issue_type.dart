class IssueType{
  final int? id;
  final String? name;

  IssueType({
    this.id,
    this.name,
  });

  factory IssueType.fromJson(Map<String, dynamic> json) {
    return IssueType(
      id: json['id'],
      name: json['name'],
    );
  }
}