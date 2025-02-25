abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final String message;

  AddProductSuccess(this.message);
}

class AddProductFailure extends AddProductState {
  final String errorMessage;

  AddProductFailure(this.errorMessage);
}