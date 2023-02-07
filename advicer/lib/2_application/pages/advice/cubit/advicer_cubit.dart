import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

const String serverFailure = "API error, please try again";
const String cacheFailure = "cache failure, please try again";
const String generalFailure = "something gone wrong please try again";

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    //businness logic

    final failureOrAdvice = await adviceUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) =>
          emit(AdvicerStateError(message: _maoFailureToMessage(failure))),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
    // emit(AdvicerStateError(message: 'error!'));
  }
}

String _maoFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailure;
    case CacheFailure:
      return cacheFailure;
    default:
      return generalFailure;
  }
}
