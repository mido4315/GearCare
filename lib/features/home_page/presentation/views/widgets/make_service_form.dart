import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/constants/map_helper.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/home_page/presentation/view%20model/home_view_cubit/home_view_cubit.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../widgets/custom_dropdown_button_with_search.dart';

class MakeServiceForm extends StatefulWidget {
  const MakeServiceForm({super.key});

  @override
  State<MakeServiceForm> createState() => _MakeServiceFormState();
}

class _MakeServiceFormState extends State<MakeServiceForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController mapTextController = TextEditingController(text: 'Pickup Location');

  String _pickupLocation = 'Pickup Location';
  String? _carModel;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: mapTextButton(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropDownButtonWithSearch(
                  itemList: AppConstants.carBrands,
                  onChanged: (String? value) {
                    _carModel = value;
                    BlocProvider
                        .of<HomeViewCubit>(context)
                        .carType = value ?? '';
                  },
                  hintText: 'Car Brand',
                  selectedItem: _carModel,
                ),
              ),
            ],
          ),
        ));
  }

  Widget mapTextButton(BuildContext context) {
    return TextField(
      controller:mapTextController,
      onTap: () async {
        setState(() {
          mapTextController.text = "Loading...";
        });
        List<String> address = await MapHelper.determinePosition();
        setState(() {
          mapTextController.text = address[0];
        });

        BlocProvider
            .of<HomeViewCubit>(context)
            .location = address[0];
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: Icon(
          Icons.my_location,
          color: AppColors.kPrimaryColor.withOpacity(.3),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(
      {required String text, required IconData icon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      prefixIcon: Icon(
        icon,
        color: AppColors.kPrimaryColor.withOpacity(.3),
      ),
      hintText: text,
      hintStyle: Styles.textStyle24.copyWith(
        color: AppColors.kPrimaryColor.withOpacity(.3),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kPrimaryColor.withOpacity(.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kPrimaryColor.withOpacity(.3),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.kPrimaryColor.withOpacity(.3),
        ),
      ),
    );
  }
}