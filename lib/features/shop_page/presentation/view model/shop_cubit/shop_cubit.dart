import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/features/merchant/posts/presentation/views/add_new_product.dart';

import '../../../../../core/models/product_model.dart';
import '../../../data/shop_repo_impl.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopRepoImpl shopRepo;

  ShopCubit(this.shopRepo) : super(ShopInitial());

  List<ProductModel> products = [];

  Future<void> getProducts({String? searchString}) async {
    emit(ShopLoading());
    var result = await shopRepo.getProducts(searchString: searchString);
    result.fold(
      (failure) {
        emit(ShopFailure(failure.errorMessage));
      },
      (productsList) {
        products = productsList;
        emit(ShopSuccess(productsList));
      },
    );
  }
}