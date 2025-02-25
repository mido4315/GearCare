import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/home_page/presentation/views/widgets/available_provider_container.dart';

import '../../../../../core/utils/styles.dart';
import '../../view model/home_view_cubit/home_view_cubit.dart';

class AvailableProviderListViews extends StatelessWidget {
  const AvailableProviderListViews({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var serviceProvidersLength =
        BlocProvider.of<HomeViewCubit>(context).serviceProviders.length;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(24),
          color: AppColors.kPrimaryColor),
      width: context.getWidth(givenWidth: 374),
      height: context.getHeight(givenHeight: 500),
      child: serviceProvidersLength != 0
          ? ListView.builder(
              itemCount: serviceProvidersLength,
              itemBuilder: (context, index) {
                return AvailableProvidersContainer(
                  onTap: onTap,
                  name: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .name ??
                      "Field is null",
                  number: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .number ??
                      "Field is null",
                  email: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .email ??
                      "Field is null",
                  location: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .location ??
                      "Field is null",
                  photoId: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .photoId ??
                      "Field is null",
                  rate: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .rate ??
                      0,
                  specialization: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .specialization ??
                      List.generate(
                          BlocProvider.of<HomeViewCubit>(context)
                              .serviceProviders
                              .length,
                          (index) => "Field is null"),
                  carTypeToRepair: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .carTypeToRepair ??
                      "Field is null",
                  available: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .available ??
                      true,
                  userType: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .userType ??
                      "Field is null",
                  id: BlocProvider.of<HomeViewCubit>(context)
                          .serviceProviders[index]
                          .id ??
                      "ID not Found",
                );
              })
          : Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: context.getHeight(givenHeight: 75),
                width: context.getWidth(givenWidth: 364),
                decoration: const BoxDecoration(color: AppColors.kPrimaryColor),
                child: const Text(
                  "There is no Service Providers available",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}