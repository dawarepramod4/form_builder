import 'dart:convert';

class Data {
  final String id;
  final String question;
  final dynamic  answer;
  Data({
    required this.id,
    required this.question,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
