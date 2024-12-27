part of 'data_plan_bloc.dart';

sealed class DataPlanState extends Equatable {
  const DataPlanState();

  @override
  List<Object> get props => [];
}

final class DataPlanInitial extends DataPlanState {}

class DataPlanLoading extends DataPlanState {}

class DataPlanFailed extends DataPlanState {
  final String e;
  const DataPlanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DataPlanSuccess extends DataPlanState {}
