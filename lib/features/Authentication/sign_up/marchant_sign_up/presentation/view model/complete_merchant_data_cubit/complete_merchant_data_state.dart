part of 'complete_merchant_data_cubit.dart';

abstract class CompleteMerchantDataState {}

class CompleteMerchantDataInitial extends CompleteMerchantDataState {}
class CompleteMerchantDataSuccess extends CompleteMerchantDataState {}
class CompleteMerchantDataLoading extends CompleteMerchantDataState {}

class CompleteMerchantDataFailure extends CompleteMerchantDataState {
  final String errorMessage;
  CompleteMerchantDataFailure(this.errorMessage);
}