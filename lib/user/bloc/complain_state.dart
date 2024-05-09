import 'package:absher/user/bloc/complain_event.dart';

class ComplainState {
  const ComplainState({
    this.event = const InitialEvent(),
    this.message = "",
  });
  final ComplainEvent event;
  final String message;

  ComplainState copyWith({String? message, ComplainEvent? event}) =>
      ComplainState(
        event: event ?? this.event,
        message: message ?? this.message,
      );
}
