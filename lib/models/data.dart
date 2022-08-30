import 'dart:convert';

class Data {
  final String id;
  final String question;
        dynamic answer;
  final String element;
  final dynamic options;
  
  Data({
    required this.id,
    required this.question,
    required this.answer,
    required this.element,
    required this.options,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'element': element,
      'options': options,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answer: map['answer'] ?? null,
      element: map['element'] ?? '',
      options: map['options'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
