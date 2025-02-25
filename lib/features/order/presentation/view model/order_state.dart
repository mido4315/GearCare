part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final OrderModel order;

  OrderSuccess(this.order);
}

class OrderFailure extends OrderState {
  final String errorMessage;

  OrderFailure(this.errorMessage);
}