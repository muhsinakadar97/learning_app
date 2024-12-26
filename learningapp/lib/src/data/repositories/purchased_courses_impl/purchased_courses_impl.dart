import 'package:dartz/dartz.dart';
import 'package:learningapp/src/data/models/course.dart';
import 'package:learningapp/src/domain/repositories/purchased_course_repo/purchased_course_repo.dart';

import '../../../config/network/failure.dart';

class PurchasedCoursesImpl implements PurchasedCourseRepo {
  PurchasedCoursesImpl();

  @override
  Future<Either<Failure, List<Course>>> fetchPurchasedCourses() async {
    try {
      List<Course> purchasedCoursesList =
          (purchasedCourseListJson as List<dynamic>)
              .map((e) => Course.fromJson(e))
              .toList();

      return Right(purchasedCoursesList);
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch courses: ${e.toString()}'));
    }
  }
}

List<Map<String, dynamic>> purchasedCourseListJson = [
  {"courseName": "PHP", "logo": "assets/images/php.png", "rate": "1700/-"},
  {
    "courseName": "Django",
    "logo": "assets/images/django_logo.png",
    "rate": "2900/-"
  },
];
