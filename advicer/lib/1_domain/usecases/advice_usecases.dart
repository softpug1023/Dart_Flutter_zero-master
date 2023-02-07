import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    //call to repo went good
    // return right(AdviceEntity(advice: 'fake advice', id: 1));
    //call to repo went back
    return left(ServerFailure());
  }
}
