part of 'complete_service_provider_data_cubit.dart';

abstract class CompleteServiceProviderDataState {}

class CompleteServiceProviderDataInitial extends CompleteServiceProviderDataState {}
class CompleteServiceProviderDataSuccess extends CompleteServiceProviderDataState {}
class CompleteServiceProviderDataLoading extends CompleteServiceProviderDataState {}

class CompleteServiceProviderDataFailure extends CompleteServiceProviderDataState {
  final String errorMessage;
  CompleteServiceProviderDataFailure(this.errorMessage);
}