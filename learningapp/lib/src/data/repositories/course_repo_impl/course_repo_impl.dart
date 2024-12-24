import 'package:dartz/dartz.dart';
import 'package:learningapp/src/data/models/course.dart';

import '../../../config/network/failure.dart';
import '../../../domain/repositories/course_repo/course_repo.dart';

class CourseRepoImpl implements CourseRepo {
  CourseRepoImpl();

  @override
  Future<Either<Failure, List<Course>>> fetchCourses() async {
    try {
      List<Course> courseList = (courseListJson as List<dynamic>)
          .map((e) => Course.fromJson(e))
          .toList();

      return Right(courseList);
    } catch (e) {
      return Left(Failure(message: 'Failed to fetch courses: ${e.toString()}'));
    }
  }

  // @override
  // Future<Either<Failure, Course>> fetchCourseOverview(
  //     {required String courseId}) async {
  //   try {
  //     return Right(Course(
  //         courseName: 'courseName', logo: 'logo', rate: 'rate', sections: []));
  //   } catch (e) {
  //     return Left(
  //         Failure(message: 'Failed to fetch course overview: ${e.toString()}'));
  //   }
  // }
}

List<Map<String, dynamic>> courseListJson = [
  {
    "courseName": "Python",
    "logo": "assets/images/python_logo.jpg",
    "rate": "2500/-"
  },
  {
    "courseName": "Flutter",
    "logo": "assets/images/flutter_logo.png",
    "rate": "2700/-"
  },
  {"courseName": "PHP", "logo": "assets/images/php.png", "rate": "2000/-"},
  {
    "courseName": "Django",
    "logo": "assets/images/django_logo.png",
    "rate": "2900/-"
  }
];