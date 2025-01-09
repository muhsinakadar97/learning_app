import 'chapter.dart';

class Section {
  final String sectionNo;
  final String sectionName;
  List<Chapter> chapters;

  Section({
    required this.sectionNo,
    required this.sectionName,
    required this.chapters,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    var chaptersList = (map['chapters'] as List<dynamic>)
        .map(
            (chapterMap) => Chapter.fromMap(chapterMap as Map<String, dynamic>))
        .toList();

    return Section(
      sectionNo: map['sectionNo'] as String,
      sectionName: map['sectionName'] as String,
      chapters: chaptersList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sectionNo': sectionNo,
      'sectionName': sectionName,
      'chapters': chapters.map((chapter) => chapter.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return "sectionNo : $sectionNo sectionName : $sectionName chapters : $chapters";
  }
}
