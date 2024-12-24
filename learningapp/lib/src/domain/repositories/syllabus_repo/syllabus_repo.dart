import 'package:dartz/dartz.dart';

import '../../../config/network/failure.dart';
import '../../../data/models/chapter.dart';
import '../../../data/models/section.dart';

abstract class SyllabusRepo {
  Future<Either<Failure, List<Section>>> fetchSections(String courseName);
  
}
