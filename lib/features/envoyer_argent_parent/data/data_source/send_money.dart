// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendMoney {
  final String title;
  final String description;
  final String imagePath;

  SendMoney({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  SendMoney copyWith({
    String? title,
    String? description,
    String? imagePath,
  }) {
    return SendMoney(
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'imagePath': imagePath,
    };
  }

  factory SendMoney.fromMap(Map<String, dynamic> map) {
    return SendMoney(
      title: map['title'] as String,
      description: map['description'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendMoney.fromJson(String source) =>
      SendMoney.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SendMoney(title: $title, description: $description, imagePath: $imagePath)';

  @override
  bool operator ==(covariant SendMoney other) {
    if (identical(this, other)) return true;

    return other.title == title && other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
