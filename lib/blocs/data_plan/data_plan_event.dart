part of 'data_plan_bloc.dart';

sealed class DataPlanEvent extends Equatable {
  const DataPlanEvent();

  @override
  List<Object> get props => [];
}

class DataPlanFormPost extends DataPlanEvent {
  final DataPlanFormModel data;
  const DataPlanFormPost(this.data);

  @override
  List<Object> get props => [data];
}
