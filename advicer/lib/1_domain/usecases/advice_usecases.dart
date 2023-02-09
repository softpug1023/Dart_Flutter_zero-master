import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../../0_data/repositories/advice_repo_impl.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;
  AdviceUseCases({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();

    //space for business logic
  }
}
