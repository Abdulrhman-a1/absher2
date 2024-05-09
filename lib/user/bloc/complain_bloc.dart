import 'dart:developer';
import 'package:absher/user/bloc/complain_event.dart';
import 'package:absher/user/bloc/complain_state.dart';
import 'package:absher/user/business/entity/complain.dart';
import 'package:absher/user/business/repository/gpt_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplainBLOC extends Bloc<ComplainEvent, ComplainState> {
  ComplainBLOC({required this.repo}) : super(ComplainState()) {
    on<ComplainStatementChangeEvent>(
      (event, emit) => emit(state.copyWith(message: event.complain)),
    );

    on<SendToAnalysisEvent>((event, emit) async {
      try {
        emit(state.copyWith(event: LoadingEvent()));
        Complain complain = await repo.analyzeComplain(complain: state.message);
        emit(
          state.copyWith(event: AnalysisSuccessfullEvent(complain: complain)),
        );
      } catch (e) {
        log("ComplainBLOC [Error]:\n${e.toString()}");
        emit(state.copyWith(event: AnalysisFailEvent(error: e.toString())));
      }
    });
  }

  final GPTRepo repo;
}
