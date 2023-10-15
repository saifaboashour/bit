class Card {
  final int? id;
  final String? serial1;
  final String? serial2;
  final String? number1;
  final String? number2;
  final String? cvc;
  final String? expirationDate;
  final bool? isPrinted;

  Card({
    this.id,
    this.serial1,
    this.serial2,
    this.number1,
    this.number2,
    this.cvc,
    this.expirationDate,
    this.isPrinted,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      serial1: json['serial1'],
      serial2: json['serial2'],
      number1: json['number1'],
      number2: json['number2'],
      cvc: json['cvc'],
      expirationDate: json['expiration_date'],
      isPrinted: json['is_printed'] == "1" ? true : false,
    );
  }
}
