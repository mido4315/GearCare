abstract class RemoveProductState {}

class RemoveProductInitial extends RemoveProductState {}

class RemoveProductLoading extends RemoveProductState {}

class RemoveProductSuccess extends RemoveProductState {
  final String message;

  RemoveProductSuccess(this.message);
}

class RemoveProductFailure extends RemoveProductState {
  final String errorMessage;

  RemoveProductFailure(this.errorMessage);
}