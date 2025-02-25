import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_model.dart';
import '../../../data/cart_repo/cart_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final CartRepo cartRepo;
  List<ProductModel> products = [];

  GetProductsCubit(this.cartRepo) : super(GetProductsInitial());

  Future<void> getCartProducts() async {
    emit(GetProductsLoading());
    Either<Failure, List<ProductModel>> result =
        await cartRepo.getProductsInCart();
    result.fold((failure) => emit(GetProductsFailure(failure.errorMessage)),
        (products) {
      products = products;
      emit(GetProductsLoaded(products));
    });
  }
}