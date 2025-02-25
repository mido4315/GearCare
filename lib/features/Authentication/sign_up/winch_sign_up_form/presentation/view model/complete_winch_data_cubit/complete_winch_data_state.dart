part of 'complete_winch_data_cubit.dart';

abstract class CompleteWinchDataState {}

class CompleteWinchDataInitial extends CompleteWinchDataState {}
class CompleteWinchDataSuccess extends CompleteWinchDataState {}
class CompleteWinchDataLoading extends CompleteWinchDataState {}

class CompleteWinchDataFailure extends CompleteWinchDataState {
  final String errorMessage;
  CompleteWinchDataFailure(this.errorMessage);
}