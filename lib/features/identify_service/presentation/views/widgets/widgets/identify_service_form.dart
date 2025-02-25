import 'package:flutter/material.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/identify_service/presentation/views/widgets/widgets/service_item.dart';

class IdentifyServiceForm extends StatefulWidget {
  const IdentifyServiceForm({Key? key}) : super(key: key);

  @override
  State<IdentifyServiceForm> createState() => _IdentifyServiceFormState();
}

class _IdentifyServiceFormState extends State<IdentifyServiceForm> with SingleTickerProviderStateMixin {
  bool _isColumnVisible = false;
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  final List<Map<String, String>> services = [
    {'service': 'Customer', 'pushName': AppRouter.kCustSignUp},
    {'service': 'Mechanic', 'pushName': AppRouter.kMaintSignUp},
    {'service': 'Electrician', 'pushName': AppRouter.kMaintSignUp},
    {'service': 'Winch', 'pushName': AppRouter.kWinchSignUp},
    {'service': 'Merchant', 'pushName': AppRouter.kMarchantSignUp}
  ];

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isColumnVisible = !_isColumnVisible;
              if (_isColumnVisible) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 5),
            height: context.height * .077,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Identify Your Service',
                  style: Styles.textStyle24,
                ),
                Image.asset(
                  AssetData.servicesIcon,
                  height: context.height * 0.9,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Visibility(
          visible: _isColumnVisible,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return SlideTransition(
                position: _slidingAnimation,
                child: Column(
                  children: List.generate(
                    services.length,
                    (index) => ServiceItem(
                      text: services[index]['service']!,
                      routeName: services[index]['pushName']!,
                      index: index,
                      servicesLength: services.length - 1,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _slidingAnimation = Tween<Offset>(begin: const Offset(0, -.4), end: const Offset(0, 0)).animate(_animationController);
  }
}