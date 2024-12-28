part of 'tip_bloc.dart';

sealed class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

final class TipInitial extends TipState {}

class TipLoading extends TipState {}

class TipFailed extends TipState {
  final String e;
  const TipFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TipSuccess extends TipState {
  final List<TipsModel> tip;
  const TipSuccess(this.tip);

  @override
  List<Object> get props => [tip];
}
