part of 'gate_info_cubit.dart';

sealed class GateInfoState extends Equatable {
  const GateInfoState();

  @override
  List<Object> get props => [];
}

final class GateInfoInitial extends GateInfoState {}

class GateInfoError extends GateInfoState {
  final String message;

  const GateInfoError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class GateInfoSuccess extends GateInfoState {
  final dynamic response;

  const GateInfoSuccess({
    required this.response,
  });

  @override
  List<Object> get props => [response];
}
