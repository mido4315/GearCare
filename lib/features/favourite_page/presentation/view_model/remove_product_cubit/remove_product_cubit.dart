import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:gear_care/features/favourite_page/data/cart_repo/cart_repo_impl.dart';

import '../../../../../core/errors/failure.dart';
import 'remove_product_state.dart';

class RemoveProductCubit extends Cubit<RemoveProductState> {
  final CartRepoImpl cartRepo;

  RemoveProductCubit(this.cartRepo) : super(RemoveProductInitial());

  Future<void> removeFromCart(String id, int quantity) async {
    emit(RemoveProductLoading());
    Either<Failure, void> result =
        await cartRepo.removeProductFromCart(id, quantity);
    result.fold(
      (failure) => emit(RemoveProductFailure(failure.errorMessage)),
      (_) => emit(RemoveProductSuccess('Product removed from cart!')),
    );
  }
}