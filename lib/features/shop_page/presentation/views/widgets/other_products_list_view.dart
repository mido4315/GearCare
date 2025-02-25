import 'package:flutter/material.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/other_product_item.dart';

class OtherProductsListView extends StatelessWidget {
  const OtherProductsListView({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35, // You can adjust the fraction as per your requirement
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const SizedBox(
            width: 150, // Adjust the width as per your requirement
            child: OtherProductItem(),
          );
        },
      ),
    );
  }
}
