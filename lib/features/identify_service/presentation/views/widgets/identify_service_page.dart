
import 'package:flutter/material.dart';
import 'package:gear_care/features/identify_service/presentation/views/widgets/widgets/identify_service_body.dart';

class IdentifyService extends StatelessWidget {
  const IdentifyService({Key? key}) : super(key: key);
    static String routName='IdentifyService';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IdentifyServiceBody(),
    );
  }
}