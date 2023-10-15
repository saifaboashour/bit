class ProductInputAnswer{
  final String? fieldId;
  final dynamic answer;

  ProductInputAnswer({
    this.fieldId,
    this.answer,
  });

  factory ProductInputAnswer.fromJson(Map<String, dynamic> json) {
    return ProductInputAnswer(
      fieldId: json['field_id'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'field_id': fieldId,
      'answer': answer,
    };
  }
}