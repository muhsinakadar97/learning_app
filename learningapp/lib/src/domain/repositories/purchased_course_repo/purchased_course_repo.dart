import 'package:dartz/dartz.dart';

import '../../../config/network/failure.dart';
import '../../../data/models/course.dart';

abstract class PurchasedCourseRepo {
  Future<Either<Failure, List<Course>>> fetchPurchasedCourses();
}
