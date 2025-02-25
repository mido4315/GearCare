import 'package:flutter/material.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/custom_shopping_button.dart';

class ShoppingActionButtons extends StatelessWidget {
  const ShoppingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomShoppingButton(text: 'Electrics',),
        SizedBox(width: 32,),
        CustomShoppingButton(text: 'Electrics',),
      ],
    );
  }
}

