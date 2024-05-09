import 'package:absher/user/business/entity/complain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ComplainEvent {
  const ComplainEvent();
}

class InitialEvent extends ComplainEvent {
  const InitialEvent();
}

class LoadingEvent extends ComplainEvent {
  const LoadingEvent();
}

class ComplainStatementChangeEvent extends ComplainEvent {
  const ComplainStatementChangeEvent({required this.complain});
  final String complain;
}

class SendToAnalysisEvent extends ComplainEvent {
  const SendToAnalysisEvent();
}

class AnalysisSuccessfullEvent extends ComplainEvent {
  const AnalysisSuccessfullEvent({required this.complain});
  final Complain complain;
}

class AnalysisFailEvent extends ComplainEvent {
  const AnalysisFailEvent({required this.error});
  final String error;
}

class ReAnalyzeComplainEvent extends ComplainEvent {
  const ReAnalyzeComplainEvent();
}

class SubmitEvent extends ComplainEvent {
  const SubmitEvent();
}
