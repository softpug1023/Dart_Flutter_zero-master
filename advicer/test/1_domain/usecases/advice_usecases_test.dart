import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('AdviceUsecases', () {
    group('Should return AdviceEntity', () {
      test('when AdviceRepoImpl returns a AdviceModel', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);
        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) =>
                Future.value(Right(AdviceEntity(advice: 'test', id: 42))));
        final result = await adviceUseCaseUnderTest.getAdvice();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceEntity>(AdviceEntity(advice: 'test', id: 42)));
        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });

    group('Should return Failure', () {
      test('a ServerFailure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));
        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
      test('a GeneralFailure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(Left(GeneralFailure())));
        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });
  });
}
