import 'package:dartz/dartz.dart';

import '../../../config/network/failure.dart';
import '../../../data/models/course.dart';

abstract class CourseRepo {
  Future<Either<Failure, List<Course>>> fetchCourses();
  // Future<Either<Failure, Course>> fetchCourseOverview(
  //     {required String courseId});
}
