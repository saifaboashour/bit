class State {
  final int? id;
  final String? name;

  State({
    this.id,
    this.name,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      id: json['id'],
      name: json['name'],
    );
  }
}
