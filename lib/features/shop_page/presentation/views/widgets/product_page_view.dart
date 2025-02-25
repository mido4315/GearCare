import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';

class ProductPageView extends StatefulWidget {
  const ProductPageView({Key? key, required this.pictureURL}) : super(key: key);
  final List<String> pictureURL;

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4, // Adjust as needed
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: widget.pictureURL.length,
              itemBuilder: (context, index) {
                return ImageContainer(
                  image: widget.pictureURL[index],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pictureURL.length,
                (index) => buildDot(index: index)),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.kPrimaryColor.withOpacity(.8) : Colors.grey.withOpacity(.5),
        shape: BoxShape.circle,
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key, required this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: image != null
            ? Image.network(image!)
            : Image.asset(AssetData.whiteBackGroung), // Fixed typo
      ),
    );
  }
}