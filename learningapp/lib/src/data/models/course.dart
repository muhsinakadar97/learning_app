import 'dart:math';

import 'section.dart';

class Course {
  final String courseName;
  final String logo;
  final String rate;
  final List<Section> sections;

  Course({
    required this.courseName,
    required this.logo,
    required this.rate,
    required this.sections,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'],
      logo: json['logo'],
      rate: json['rate'],
      sections: json['sections'] ?? [],
    );
  }

   @override
  String toString() {
    return 'Course(courseName: $courseName, logo: $logo, rate: $rate, sections : $sections)';
  }
}
