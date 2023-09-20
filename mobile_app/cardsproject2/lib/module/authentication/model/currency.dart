class Currency {
  final int? id;
  final String? name;
  final String? symbol;
  final String? toJod;

  Currency({
    this.id,
    this.name,
    this.symbol,
    this.toJod,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      toJod: json['to_jod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'to_jod': toJod,
    };
  }
}
