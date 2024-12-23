part of 'payment_method_bloc.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodFailed extends PaymentMethodState {
  final String e;
  const PaymentMethodFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodModel> data;
  const PaymentMethodSuccess(this.data);

  @override
  List<Object> get props => [data];
}
