import 'dart:convert';

import 'package:flutter/material.dart';

class CourseModel {
  final String image;
  final String name;
  final Color color;

  CourseModel({
    required this.image,
    required this.name,
    required this.color,
  });

  CourseModel copyWith({
    String? image,
    String? name,
    Color? color,
  }) {
    return CourseModel(
      image: image ?? this.image,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'image': image});
    result.addAll({'name': name});
    result.addAll({'color': color.value});
  
    return result;
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source));

  @override
  String toString() => 'CourseModel(image: $image, name: $name, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CourseModel &&
      other.image == image &&
      other.name == name &&
      other.color == color;
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode ^ color.hashCode;
}
