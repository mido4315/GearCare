import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../favourite_page/data/cart_repo/cart_repo.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final CartRepo cartRepo;

  AddProductCubit(this.cartRepo) : super(AddProductInitial());

  Future<void> addToCart(String id, int quantity) async {
    emit(AddProductLoading());
    Either<Failure, void> result =
        await cartRepo.addProductToCart(id, quantity);
    result.fold(
      (failure) => emit(AddProductFailure(failure.errorMessage)),
      (_) => emit(AddProductSuccess('Product added to cart!')),
    );
  }
}