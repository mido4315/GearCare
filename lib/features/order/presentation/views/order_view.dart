import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/helper/custom_snack_bar.dart';
import 'package:gear_care/core/utils/app_router.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/utils/styles.dart';
import '../view model/order_cubit.dart';

class CreateOrder extends StatefulWidget {
  final String initialLocation;
  final String initialCarType;
  final String serviceProviderId;
  final String userType;

  const CreateOrder({
    Key? key,
    required this.initialLocation,
    required this.initialCarType,
    required this.serviceProviderId,
    required this.userType,
  }) : super(key: key);

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final _formKey = GlobalKey<FormState>();
  final _problemDescriptionController = TextEditingController();
  final _locationController = TextEditingController();
  String? _carType = "";

  @override
  void initState() {
    super.initState();
    _locationController.text = widget.initialLocation;
    _carType = widget.initialCarType;
  }

  @override
  void dispose() {
    _problemDescriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: context.getHeight(givenHeight: 80),
        elevation: 7,
        title: Text(
          'Make an order',
          style: Styles.textStyle26normal
              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: context.getHeight(givenHeight: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.height * 0.05),
                TextFormField(
                  controller: _problemDescriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: 'Problem Description',
                      labelStyle: Styles.textStyle24,
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.kPrimaryColor)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.kPrimaryColor))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the problem description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.03),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.03),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    searchFieldProps: TextFieldProps(),
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: AppConstants.carBrands,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_eta),
                      label: Text("Car Brand"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  onChanged: (value) {
                    _carType = value;
                  },
                  selectedItem: _carType,
                  validator: (String? item) {
                    if (item == null) {
                      return "Please choose the car type";
                    } else {
                      _carType = item;
                      return null;
                    }
                  },
                ),
                SizedBox(height: context.height * 0.25),
                BlocConsumer<OrderCubit, OrderState>(
                  listener: (context, state) {
                    if (state is OrderSuccess) {
                      customSnackBar(context, "Order submitted successfully!");
                      context.go(AppRouter.kHomeView);
                    } else if (state is OrderFailure) {
                      customSnackBar(context,
                          'Failed to submit order: ${state.errorMessage}');
                    }
                  },
                  builder: (context, state) {
                    if (state is OrderLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          backgroundColor: AppColors.kPrimaryColor),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // var user = UserModel(name: getIt.get<SharedPrefs>().name, email: getIt.get<SharedPrefs>().email, password: getIt.get<SharedPrefs>().)
                          print(_carType);
                          print(_locationController.text);
                          print(_problemDescriptionController.text);
                          print(widget.serviceProviderId);

                          final OrderModel order = OrderModel(
                            carType: _carType,
                            location: _locationController.text,
                            problemDescription:
                                _problemDescriptionController.text,
                            serviceProviderId: widget.serviceProviderId,
                          );

                          BlocProvider.of<OrderCubit>(context).postOrder(order,widget.userType);
                        }
                      },
                      child: Container(
                        height: context.height * 0.07,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Submit Your Order',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}