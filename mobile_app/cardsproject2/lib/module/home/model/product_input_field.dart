class ProductInputField{
  final int? id;
  final String? name;
  final String? type;
  final bool? isConfirmed;
  final String? answer;

  ProductInputField({
      this.id,
      this.name,
      this.type,
      this.isConfirmed,
    this.answer,
  });

  factory ProductInputField.fromJson(Map<String, dynamic> json) {
    return ProductInputField(
      id: json['id'],
      name: json['name'],
      type: json['field_type'],
      isConfirmed: json['is_confirmed'] == "1" ? true:false,
      answer: json['answer'],
    );
  }
}